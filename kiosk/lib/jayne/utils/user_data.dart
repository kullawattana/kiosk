import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  late SharedPreferences _preferences;

  UserData(SharedPreferences prefs) {
    _preferences = prefs;
    initializePrefs();
  }

  void initializePrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  void setBearerAccessToken({required String bearerAccessToken}){
    _preferences.setString('bearerAccessToken', bearerAccessToken);
  }

  String getBearerAccessToken(){
    return _preferences.getString('bearerAccessToken') ?? "";
  }
}