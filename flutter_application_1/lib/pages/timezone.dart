class Timezone {
  String offset;
  String mainCity;
  String code;

  Timezone({required this.offset, required this.mainCity, required this.code});

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      offset: json['offset'],
      mainCity: json['main_city'],
      code: json['code'],
    );
  }
}