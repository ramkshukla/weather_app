class MainDTO {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  int? seaLevel;
  int? groundLevel;

  MainDTO({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.groundLevel,
  });

  factory MainDTO.fromJson(Map<String, dynamic> json) {
    return MainDTO(
      temp: json["temp"],
      feelsLike: json["feels_like"],
      tempMin: json["temp_min"],
      tempMax: json["temp_max"],
      pressure: json["pressure"],
      humidity: json["humidity"],
      seaLevel: json.containsKey("sea_level") ? json["sea_level"] : null,
      groundLevel: json.containsKey("grnd_level") ? json["grnd_level"] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "temp": temp,
      "feels_like": feelsLike,
      "temp_min": tempMin,
      "temp_max": tempMax,
      "pressure": pressure,
      "humidity": humidity,
      "sea_level": seaLevel,
      "grnd_level": groundLevel,
    };
  }
}
