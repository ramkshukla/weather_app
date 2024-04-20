class SystemDTO {
  final String country;

  SystemDTO({required this.country});

  factory SystemDTO.fromJson(Map<String, dynamic> json) {
    return SystemDTO(
      country: json["country"],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"country": country};
  }
}
