import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khedni_m3k/View%20Model/app_provider.dart';
import 'package:provider/provider.dart';
import 'Core/utils/Localization/app_localizations.dart';
import 'Core/utils/Theme/app_theme.dart';
import 'Core/utils/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        title: 'Khedny M3K',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        supportedLocales: const [Locale('en'), Locale('ar')],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (deviceLocale != null &&
                deviceLocale.languageCode == locale.languageCode) {
              return deviceLocale;
            }
          }

          return supportedLocales.first;
        },
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.splashRoute,
      ),
    );
  }
}
