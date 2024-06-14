import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceData {
  static const String accessToken = "token";

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(accessToken, token);

    return;
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(accessToken) ?? "";
  }
}
