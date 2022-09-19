abstract class ThemeRepo {
  bool isDarkTheme();
  Future<void> setTheme({required bool isDark});
}
