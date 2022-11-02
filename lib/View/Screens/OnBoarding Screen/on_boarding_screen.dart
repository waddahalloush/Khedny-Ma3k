import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/Core/Core/utils/app_router.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';

import '../../../Core/Core/constants/asset_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> introList = [
      PageViewModel(
        title: "Welcome",
        body:
            "Welcome to Khedni MaaK. \n Request a ride get picked up by a \n nearby community driver ",
        image: SafeArea(
            child: Image.asset(
          AssetManager.onboarding1,
          width: context.width - 100,
          height: context.height,
        )),
        decoration: const PageDecoration(
          imageFlex: 2,
          titleTextStyle: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32.0),
          bodyTextStyle: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black45,
              fontWeight: FontWeight.w400,
              fontSize: 16.0),
        ),
      ),
      PageViewModel(
        title: "Request Ride",
        body: "Request a ride get picked up by a \n nearby community driver ",
        image: SafeArea(
            child: Image.asset(
          AssetManager.onboarding2,
          width: context.width - 100,
          height: context.height,
        )),
        decoration: const PageDecoration(
          imageFlex: 2,
          titleTextStyle: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32.0),
          bodyTextStyle: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black45,
              fontWeight: FontWeight.w400,
              fontSize: 16.0),
        ),
      ),
      PageViewModel(
        title: "Confirm Your Driver",
        body:
            "Huge drivers network helps you find \n comforable, safe and cheap ride ",
        image: SafeArea(
            child: Center(
                child: Image.asset(
          AssetManager.onboarding3,
          width: context.width - 100,
          height: context.height,
          fit: BoxFit.contain,
        ))),
        decoration: const PageDecoration(
          imageFlex: 2,
          titleTextStyle: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32.0),
          bodyTextStyle: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black45,
              fontWeight: FontWeight.w400,
              fontSize: 16.0),
        ),
      ),
      PageViewModel(
        footer: BlurButton(
            onPress: () {
              Navigator.pushNamed(context, AppRouter.createAccount);
            },
            label: "Get Started"),
        title: "Track Your Ride",
        body:
            "Know your driver in advance and be \n able to view current location in real \n time on the map",
        image: SafeArea(
            child: Center(
                child: Image.asset(
          AssetManager.onboarding2,
        ))),
        decoration: const PageDecoration(
          imageFlex: 5,
          imagePadding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          bodyFlex: 3,
          titleTextStyle: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
          bodyTextStyle: TextStyle(
              color: Colors.black45,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w400,
              fontSize: 16.0),
        ),
      ),
    ];

    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        pages: introList,
        dotsDecorator: DotsDecorator(
            activeColor: const Color.fromARGB(255, 144, 114, 226),
            size: const Size(30.0, 10.0),
            activeSize: const Size(30.0, 10.0),
            color: Colors.black26,
            spacing: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        showDoneButton: false,
        showNextButton: false,
        showBackButton: false,
        showSkipButton: false,
      ),
    );
  }
}
