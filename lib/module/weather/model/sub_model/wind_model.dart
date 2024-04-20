class WindDTO {
  final double speed;
  final int deg;

  WindDTO({required this.speed, required this.deg});

  factory WindDTO.fromJson(Map<String, dynamic> json) {
    return WindDTO(
      speed: json["speed"],
      deg: json["deg"],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "speed": speed,
      "deg": deg,
    };
  }
}
