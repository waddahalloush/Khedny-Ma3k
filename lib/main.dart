import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/View%20Model/Providers%20List/providers.dart';
import 'package:khedni_m3k/View%20Model/app_provider.dart';
import 'package:provider/provider.dart';
import 'Core/utils/Localization/app_localizations.dart';
import 'Core/utils/Theme/app_theme.dart';
import 'Core/utils/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providersList,
        child: ScreenUtilInit(
          builder: (context, child) => Consumer<AppProvider>(
            builder: (context, myType, child) {
              return MaterialApp(
                title: 'Khedny M3K',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: myType.isDark ? ThemeMode.dark : ThemeMode.light,
                supportedLocales: const [Locale('en'), Locale('ar')],
                locale: myType.lang,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                // localeResolutionCallback: (deviceLocale, supportedLocales) {
                //   for (var locale in supportedLocales) {
                //     if (deviceLocale != null &&
                //         deviceLocale.languageCode == locale.languageCode) {

                //       return deviceLocale;
                //     }
                //   }

                //   return supportedLocales.first;
                // },
                onGenerateRoute: AppRouter.onGenerateRoute,
                initialRoute: AppRouter.splashRoute,
              );
            },
          ),
          designSize: const Size(375, 812),
        ));
  }
}
