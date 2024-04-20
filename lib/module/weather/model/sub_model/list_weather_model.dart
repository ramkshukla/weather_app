class ListWeatherDTO {
  final int id;
  final String main;
  final String description;
  final String icon;

  ListWeatherDTO({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory ListWeatherDTO.fromJson(Map<String, dynamic> json) {
    return ListWeatherDTO(
      id: json["id"],
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
    );
  }
}
