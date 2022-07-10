import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUser {

  static clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
