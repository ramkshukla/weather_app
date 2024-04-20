class CoordDTO {
  final double latitude;
  final double longitude;

  CoordDTO({required this.latitude, required this.longitude});

  factory CoordDTO.fromJson(Map<String, dynamic> json) {
    return CoordDTO(
      latitude: json["lat"],
      longitude: json["lon"],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "lat": latitude,
      "lon": longitude,
    };
  }
}
