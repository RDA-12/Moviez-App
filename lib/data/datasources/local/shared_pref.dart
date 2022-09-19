import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatasource {
  bool checkUser();
  Future<void> setTheme({required bool isDark});
  bool isDarkTheme();
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
    await sharedPreferences.remove("isLogin");
  }

  @override
  Future<void> setTheme({required bool isDark}) async {
    await sharedPreferences.setBool("isDark", isDark);
  }

  @override
  bool isDarkTheme() {
    return sharedPreferences.getBool("isDark") ?? false;
  }
}
