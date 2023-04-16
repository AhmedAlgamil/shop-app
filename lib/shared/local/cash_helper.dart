import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> setBool(String key, bool value) async {
    return await sharedPreferences?.setBool(key, value);
  }

  static get(String key) {
    return sharedPreferences?.get(
      key,
    );
  }
}
