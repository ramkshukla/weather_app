class CloudsDTO {
  final int all;
  CloudsDTO({required this.all});

  factory CloudsDTO.fromJson(Map<String, dynamic> json) {
    return CloudsDTO(
      all: json["all"],
    );
  }
}
