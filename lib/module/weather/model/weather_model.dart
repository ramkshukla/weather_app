import 'package:weather_app/module/weather/model/weather_description_model.dart';

class WeatherDTO {
  final String message;
  final String code;
  final int count;
  final List<WeatherDescriptionDTO> weatherDescription;

  WeatherDTO({
    required this.message,
    required this.code,
    required this.count,
    required this.weatherDescription,
  });

  factory WeatherDTO.fromJson(Map<String, dynamic> json) {
    return WeatherDTO(
      message: json["message"],
      code: json["cod"],
      count: json["count"],
      weatherDescription: List.from(
        json["list"].map(
          (e) => WeatherDescriptionDTO.fromJson(e),
        ),
      ),
    );
  }

  Map<String, dynamic> tojson() {
    return <String, dynamic>{
      "message": message,
      "cod": code,
      "count": count,
      "list": weatherDescription,
    };
  }
}
