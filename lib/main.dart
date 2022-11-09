import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khedni_m3k/Controller/app_provider.dart';
import 'package:provider/provider.dart';

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
        theme: ThemeData(
            primaryColor: const Color(0XFF004E98),
            primaryColorDark: const Color(0XFFACACAC),
            primaryColorLight: const Color(0xFFFC6752),
            scaffoldBackgroundColor: Colors.white,
            
            appBarTheme: const AppBarTheme(
                elevation: 0,
                color: Colors.white,
                iconTheme: IconThemeData(color: Colors.black, size: 24)),
            primarySwatch: Colors.blue,
            canvasColor: const Color(0XFF877EF2),
            primaryTextTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 20,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000)),
              headline2: TextStyle(
                  fontSize: 20,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC4C4C4)),
              headline3: TextStyle(
                  fontSize: 15,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000)),
              headline5: TextStyle(
                  fontSize: 20,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF)),
              bodyText1: TextStyle(
                  fontSize: 16,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC4C4C4)),
              bodyText2: TextStyle(
                  fontSize: 16,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF423E46)),
              subtitle1: TextStyle(
                  fontSize: 15,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
              subtitle2: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Nunito",
                  color: Color.fromARGB(255, 59, 98, 238)),
              overline: TextStyle(
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              caption: TextStyle(
                  fontSize: 15,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF5E5E5E)),
            )),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.splashRoute,
      ),
    );
  }
}
