class AuthData {
  String userId;
  String refreshToken;
  String token;
  String email;

  AuthData({
    required this.email,
    required this.refreshToken,
    required this.token,
    required this.userId,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
        email: json['email'],
        refreshToken: json['refreshToken'],
        token: json['idToken'],
        userId: json['localId']);
  }
}
