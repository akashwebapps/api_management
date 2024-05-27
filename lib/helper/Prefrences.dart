import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  PreferenceManager._();

  static final PreferenceManager _instance = PreferenceManager._();

  static PreferenceManager get instance => _instance;

  SharedPreferences? _pref;

  Future<void> initPref() async {
    _pref = await SharedPreferences.getInstance();
  }

  SharedPreferences? get pref => _pref;

  Future<void> setLoggedIn(bool isLogged) async {
    await _pref?.setBool("isLogged", isLogged);
  }

  Future<void> setToken(String token) async {
    await _pref?.setString("token", token);
  }

  bool get isLoggedin => _pref?.getBool("isLogged") ?? false;
  String get getToken => _pref?.getString("token") ?? '';
}
