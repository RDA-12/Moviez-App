import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatasource {
  bool checkUser();
  Future<void> setLogin();
  Future<void> clear();
}

class SharedPrefDatasource implements LocalDatasource {
  final SharedPreferences sharedPreferences;
  SharedPrefDatasource(this.sharedPreferences);

  @override
  bool checkUser() {
    return sharedPreferences.getBool("isLogin") ?? false;
  }

  @override
  Future<void> setLogin() async {
    await sharedPreferences.setBool("isLogin", true);
  }

  @override
  Future<void> clear() async {
    await sharedPreferences.clear();
  }
}
