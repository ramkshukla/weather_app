import 'package:dartz/dartz.dart';
import 'package:weather_app/_utils/api_call.dart';
import 'package:weather_app/_utils/api_endpoint.dart';
import 'package:weather_app/_utils/api_response.dart';
import 'package:weather_app/_utils/enum.dart';
import 'package:weather_app/module/weather/model/weather_model.dart';

abstract class WeatherRepo {
  Future<Either<Failure, WeatherDTO>> getWeatherData(String cityName);
}

class WeatherRepoImpl extends WeatherRepo {
  @override
  Future<Either<Failure, WeatherDTO>> getWeatherData(String cityName) async {
    return APIcall<WeatherDTO>().handleAPI(
      endPoint: APIEndpoints.weather(cityName),
      apiCallType: APICallType.GET,
      handleSuccess: (responseBody) async {
        final data = WeatherDTO.fromJson(responseBody);
        return right(data);
      },
    );
  }
}
