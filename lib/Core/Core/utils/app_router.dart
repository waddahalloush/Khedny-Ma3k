

import 'package:flutter/material.dart';
import 'package:khedni_m3k/View/Screens/Recovery%20Screens/new_password_screen.dart';
import 'package:khedni_m3k/View/Screens/Recovery%20Screens/otp_screen.dart';
import 'package:khedni_m3k/View/Screens/Recovery%20Screens/recovery_screen.dart';

import '../../../View/Screens/OnBoarding Screen/on_boarding_screen.dart';
import '../../../View/Screens/splash_screen.dart';

class AppRouter {
  static const splashRoute = "/splash";
  static const introRoute = '/intro';
  static const recoveryRoute = '/recovery';
  static const otpRoute = '/otp';
  static const newPassRoute = '/newPass';
 
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
      case otpRoute:
        return MaterialPageRoute(
          builder: (context) => const OtpScreen(),
        );
      case newPassRoute:
        return MaterialPageRoute(
          builder: (context) => const NewPasswordScreen(),
        );

   
    }
    return null;
  }
}
