class AuthRequestModel {
  final String name;
  final String username;
  final String password;

  AuthRequestModel(
      {required this.name, required this.password, required this.username});

  factory AuthRequestModel.toJson(Map<String, dynamic> json) {
    return AuthRequestModel(
        name: json['name'],
        password: json['password'],
        username: json['username']);
  }
}
