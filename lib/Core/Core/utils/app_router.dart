import 'package:flutter/material.dart';
import 'package:khedni_m3k/View/Screens/Create%20Account%20Screen/create_account_screen.dart';
import 'package:khedni_m3k/View/Screens/Recovery%20Screens/new_password_screen.dart';
import 'package:khedni_m3k/View/Screens/Recovery%20Screens/recovery_otp_screen.dart';
import 'package:khedni_m3k/View/Screens/Recovery%20Screens/recovery_screen.dart';
import 'package:khedni_m3k/View/Screens/Sub%20Screens/test.dart';
import '../../../View/Screens/Main Screen/main_screen.dart';
import '../../../View/Screens/OTP Screen/otp_screen.dart';
import '../../../View/Screens/OnBoarding Screen/on_boarding_screen.dart';
import '../../../View/Screens/splash_screen.dart';

class AppRouter {
  static const splashRoute = "/splash";
  static const introRoute = '/intro';
  static const createAccount = '/create';
  static const recoveryRoute = '/recovery';
  static const recoverotpRoute = '/rotp';
  static const otpRoute = '/otp';
  static const newPassRoute = '/newPass';
  static const mainRoute = '/main';
  static const chatRoute = '/chat';
  static const testRoute = '/test';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case introRoute:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case recoveryRoute:
        return MaterialPageRoute(
          builder: (context) => const RecoveryScreen(),
        );
      case recoverotpRoute:
        return MaterialPageRoute(
          builder: (context) => const RecoveryOtpScreen(),
        );
      case otpRoute:
        return MaterialPageRoute(
          builder: (context) => const OtpScreen(),
        );
      case newPassRoute:
        return MaterialPageRoute(
          builder: (context) => const NewPasswordScreen(),
        );
      case createAccount:
        return MaterialPageRoute(
          builder: (context) => const CreateAccountScreen(),
        );
      case mainRoute:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );

      case testRoute:
        return MaterialPageRoute(
          builder: (context) => const Test(),
        );
    }
    return null;
  }
}
