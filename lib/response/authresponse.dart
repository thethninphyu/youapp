class AuthResponse {
  final String status;
  AuthResponse({required this.status});

  factory AuthResponse.fromJosn(Map<String, dynamic> json) {
    return AuthResponse(status: json['status']);
  }
}
