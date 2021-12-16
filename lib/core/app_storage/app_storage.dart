import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {

  static late SharedPreferences _prefs;

  static Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  static Future<void> cacheUserData({
   required String email,
    required String apiToken,
    required String uid,
  }) async {
    await _prefs.setString('email', email);
    await _prefs.setString('apiToken', apiToken);
    await _prefs.setString('uid', uid);
  }

  static bool get isLogged => _prefs.containsKey('apiToken');

  static String get apiToken => _prefs.getString('apiToken')!;
  static String get email => _prefs.getString('email')!;
  static String get uid => _prefs.getString('uid')!;

}