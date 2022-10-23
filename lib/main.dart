import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khedni_m3k/Controller/cubit/app_cubit.dart';
import 'package:khedni_m3k/Core/Core/utils/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey.shade100,
            appBarTheme: AppBarTheme(
                elevation: 0,
                color: Colors.grey.shade100,
                iconTheme: const IconThemeData(color: Colors.black, size: 20)),
            primarySwatch: Colors.blue,
            primaryTextTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 22,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000)),
              headline5: TextStyle(
                  fontSize: 22,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF)),
              bodyText1: TextStyle(
                  fontSize: 15,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF000000)),
              subtitle1: TextStyle(
                  fontSize: 15,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
              subtitle2: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                  color: Color.fromARGB(255, 59, 98, 238)),
              caption: TextStyle(
                  fontSize: 20,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            )),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.splashRoute,
      ),
    );
  }
}
