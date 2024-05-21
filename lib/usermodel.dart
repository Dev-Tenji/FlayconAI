import 'package:shared_preferences/shared_preferences.dart';

class User {
  static late SharedPreferences _preferences;
  static String _apikey = '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';
  Future init() async {
    _preferences = await SharedPreferences.getInstance();
    _apikey = _preferences.getString('apikey') ?? '';
  }

  static Future SetApi(String api) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString('apikey', api);
  }

  static getApi() => _apikey;
}
