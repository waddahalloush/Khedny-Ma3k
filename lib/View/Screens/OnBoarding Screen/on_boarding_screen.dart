import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import '../../../Core/constants/asset_manager.dart';
import '../../../Core/utils/Global Widgets/blur_button.dart';
import '../../../Core/utils/app_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> introList = [
      PageViewModel(
        title: "Welcome".tr(context),
        body: "WelcomeSub".tr(context),
        image: SafeArea(
            child: Image.asset(
          AssetManager.onboarding1,
          width: context.width - 120,
          height: context.height / 2,
        )),
        decoration: PageDecoration(
            imageFlex: 2,
            titleTextStyle: Theme.of(context).primaryTextTheme.headline6!,
            bodyTextStyle: Theme.of(context).primaryTextTheme.headline4!),
      ),
      PageViewModel(
        title: "RequestRide".tr(context),
        body: "RequestRideSub".tr(context),
        image: SafeArea(
            child: Image.asset(
          AssetManager.onboarding2,
          width: context.width - 120,
          height: context.height / 2,
        )),
        decoration: PageDecoration(
          imageFlex: 2,
          titleTextStyle: Theme.of(context).primaryTextTheme.headline6!,
          bodyTextStyle: Theme.of(context).primaryTextTheme.headline4!,
        ),
      ),
      PageViewModel(
        title: "CfmDriver".tr(context),
        body: "CfmDriverSub".tr(context),
        image: SafeArea(
            child: Center(
                child: Image.asset(
          AssetManager.onboarding3,
          width: context.width - 120,
          height: context.height / 2,
          fit: BoxFit.contain,
        ))),
        decoration: PageDecoration(
          imageFlex: 2,
          titleTextStyle: Theme.of(context).primaryTextTheme.headline6!,
          bodyTextStyle: Theme.of(context).primaryTextTheme.headline4!,
        ),
      ),
      PageViewModel(
        footer: BlurButton(
            onPress: () {
              Navigator.pushNamed(context, AppRouter.createAccount);
            },
            label: "Started".tr(context)),
        title: "Track".tr(context),
        body: "TrackSub".tr(context),
        image: SafeArea(
            child: Center(
                child: Image.asset(
          AssetManager.onboarding4,
          width: context.width - 120,
          height: context.height / 2,
        ))),
        decoration: PageDecoration(
            bodyFlex: 4,
            imageFlex: 4,
            // imagePadding: EdgeInsets.only(top: 50.h),
            titleTextStyle: Theme.of(context).primaryTextTheme.headline6!,
            bodyTextStyle: Theme.of(context).primaryTextTheme.headline4!),
      ),
    ];

    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        pages: introList,
        dotsDecorator: DotsDecorator(
            activeColor: const Color.fromARGB(255, 144, 114, 226),
            size: const Size(20.0, 8.0),
            activeSize: const Size(20.0, 8.0),
            color: Colors.grey,
            spacing: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(1))),
        showDoneButton: false,
        showNextButton: false,
        showBackButton: false,
        showSkipButton: false,
      ),
    );
  }
}
