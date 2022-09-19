import '../../domain/repositories/theme_repo.dart';
import '../datasources/local/shared_pref.dart';

class ThemeRepoImpl implements ThemeRepo {
  final LocalDatasource datasource;
  ThemeRepoImpl(this.datasource);

  @override
  bool isDarkTheme() {
    return datasource.isDarkTheme();
  }

  @override
  Future<void> setTheme({required bool isDark}) async {
    await datasource.setTheme(isDark: isDark);
  }
}
