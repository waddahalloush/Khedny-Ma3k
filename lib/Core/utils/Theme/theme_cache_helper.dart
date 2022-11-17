import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper {
  Future<void> cacheTheme(bool isDark) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isDark", isDark);
  }

  Future<bool> getCachedThemeIndex() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedTheme = sharedPreferences.getBool("isDark");
    if (cachedTheme != null) {
      return cachedTheme;
    } else {
      return false;
    }
  }
}
