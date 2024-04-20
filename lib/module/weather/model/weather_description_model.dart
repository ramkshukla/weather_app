import 'package:weather_app/module/weather/model/sub_model/clouds_model.dart';
import 'package:weather_app/module/weather/model/sub_model/coord_model.dart';
import 'package:weather_app/module/weather/model/sub_model/list_weather_model.dart';
import 'package:weather_app/module/weather/model/sub_model/main_model.dart';
import 'package:weather_app/module/weather/model/sub_model/system_model.dart';
import 'package:weather_app/module/weather/model/sub_model/wind_model.dart';

class WeatherDescriptionDTO {
  final int id;
  final String name;
  final CoordDTO coord;
  final MainDTO main;
  final int dateTime;
  final WindDTO wind;
  final SystemDTO sys;
  final CloudsDTO clouds;
  final List<ListWeatherDTO> listWeather;

  WeatherDescriptionDTO({
    required this.id,
    required this.name,
    required this.coord,
    required this.main,
    required this.dateTime,
    required this.wind,
    required this.sys,
    required this.clouds,
    required this.listWeather,
  });

  factory WeatherDescriptionDTO.fromJson(Map<String, dynamic> json) {
    return WeatherDescriptionDTO(
        id: json["id"],
        name: json["name"],
        coord: CoordDTO.fromJson(json["coord"]),
        main: MainDTO.fromJson(json["main"]),
        dateTime: json["dt"],
        wind: WindDTO.fromJson(json["wind"]),
        sys: SystemDTO.fromJson(json["sys"]),
        clouds: CloudsDTO.fromJson(json["clouds"]),
        listWeather: List.from(
          json["weather"].map(
            (e) => ListWeatherDTO.fromJson(e),
          ),
        ));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "coord": coord,
      "main": main,
      "dt": dateTime,
      "wind": wind,
      "sys": sys,
      "clouds": clouds,
      "weather": listWeather,
    };
  }
}
