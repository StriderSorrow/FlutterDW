import 'package:shared_preferences/shared_preferences.dart';

class TempData {
  static String tokenId = "session_token";
  static String token = "";

  static Future<void> storeToken(String newToken) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(tokenId, newToken);
    token = newToken;
  }
  static Future<void> restoreToken() async {
    final storage = await SharedPreferences.getInstance();
    if (storage.containsKey(tokenId)) {
      token = storage.getString(tokenId)!;
    }
  }
  static Future<void> removeToken() async {
    final storage = await SharedPreferences.getInstance();
    if (storage.containsKey(tokenId)) {
      storage.remove(tokenId);
    }
  }
}
