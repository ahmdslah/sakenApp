import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPref;

  init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  dynamic getData({required String data}) {
    return sharedPref.get(data);
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPref.setBool(key, value);
    }
    if (value is String) {
      return await sharedPref.setString(key, value);
    }
    if (value is int) {
      return await sharedPref.setInt(key, value);
    } else {
      return await sharedPref.setDouble(key, value);
    }
  }

  Future<bool> deleteData({required String key}) async {
    return await sharedPref.remove(key);
  }
}
