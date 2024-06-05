class LoginRequestModel {
  final String name;
  final String email;
  final String password;

  LoginRequestModel(
      {required this.name, required this.password, required this.email});

  factory LoginRequestModel.toJson(Map<String, dynamic> json) {
    return LoginRequestModel(
        name: json['name'], password: json['password'], email: json['email']);
  }
}
