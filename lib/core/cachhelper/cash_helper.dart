import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    return false;
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}