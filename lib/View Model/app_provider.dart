import 'package:flutter/material.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/MY%20Offereed%20Trips/become_driver_modal.dart';

import '../Core/utils/Localization/language_cache_helper.dart';
import '../Core/utils/Theme/theme_cache_helper.dart';

class AppProvider extends ChangeNotifier {
  bool isDark = false;
  Locale lang = const Locale("en");

  Future<void> setAppTheme(bool val) async {
    isDark = val;
    await ThemeCacheHelper().cacheTheme(val);
    notifyListeners();
  }

  Future<void> getSavedTheme() async {
    isDark = await ThemeCacheHelper().getCachedThemeIndex();

    notifyListeners();
  }

  Future<void> getSavedLanguage() async {
    lang = Locale(await LanguageCacheHelper().getCachedLanguageCode());

    notifyListeners();
  }

  Future<void> setApplang(String val) async {
    await LanguageCacheHelper().cacheLanguageCode(val);
    lang = Locale(val);
    notifyListeners();
  }

  int navIndex = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void changeNav(int index) {
    navIndex = index;
   
    notifyListeners();
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();

    notifyListeners();
  }
}
