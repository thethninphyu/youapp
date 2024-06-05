class ProfileResponse {
  final String message;
  final UserData userData;

  ProfileResponse({required this.message, required this.userData});
  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
        message: json['message'], userData: UserData.fromJson(json['data']));
  }
}

class UserData {
  final String email;
  final String username;
  final String name;
  final String birthday;
  final String horoscope;
  final int height;
  final int weight;
  final List<String> interests;

  UserData(
      {required this.name,
      required this.email,
      required this.birthday,
      required this.height,
      required this.horoscope,
      required this.interests,
      required this.username,
      required this.weight});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'],
      username: json['username'],
      name: json['name'],
      birthday: json['birthday'],
      horoscope: json['horoscope'],
      height: json['height'],
      weight: json['weight'],
      interests: List<String>.from(json['interests']),
    );
  }
}
