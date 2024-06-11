class ProfileRequest {
  final String name;
  final String birthday;
  final String height;
  final String weight;
  final List<String> interests;

  ProfileRequest(
      {required this.name,
      required this.birthday,
      required this.height,
      required this.weight,
      required this.interests});

  factory ProfileRequest.toJson(Map<String, dynamic> json) {
    return ProfileRequest(
        name: json['name'],
        birthday: json['birthday'],
        height: json['height'],
        weight: json['weight'],
        interests: json['interests']);
  }
}
