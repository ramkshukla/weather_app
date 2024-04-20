import 'dart:async';

import 'package:weather_app/module/weather/model/weather_model.dart';
import 'package:weather_app/module/weather/repository/weather_repo.dart';

class WeatherBloc {
  StreamController<WeatherDTO> controller = StreamController();
  Stream<WeatherDTO> get getWeatherData => controller.stream;

  Future<void> fetchWeatherData(String cityName) async {
    final weatherData = await WeatherRepoImpl().getWeatherData(cityName);
    weatherData.fold(
      (l) => null,
      (r) {
        controller.add(r);
      },
    );
  }

  void dispose() {
    controller.close();
  }
}
