import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceData {
  String accessToken = "api_authorization";

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(accessToken, token);

    return;
  }

  Future<void> getToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.getString(token) ?? "";

    return;
  }
}
