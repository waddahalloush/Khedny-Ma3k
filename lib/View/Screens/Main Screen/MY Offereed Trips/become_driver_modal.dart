// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/MY%20Offereed%20Trips/driver_setup_bottom_sheet.dart';

import '../../../../Core/constants/asset_manager.dart';
import '../../../../Core/utils/Global Widgets/blur_button.dart';

void showBecomeDriverBottomSheet(
  BuildContext context,
) =>
    showModalBottomSheet(
      useRootNavigator: false,
      barrierColor: Colors.black45,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      constraints: BoxConstraints(maxHeight: context.height - 30),
      builder: (context) => SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: context.width,
          height: context.height,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
          child: const BecomeDriverWidget(),
        ),
      ),
    );

class BecomeDriverWidget extends StatelessWidget {
  const BecomeDriverWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: 35,
          height: 5,
          decoration: BoxDecoration(
              color: const Color(0XFFE4E6E9),
              borderRadius: BorderRadius.circular(2.5)),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Image.asset(AssetManager.onboarding2),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Become".tr(context),
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          "BecomeSub".tr(context),
          style: Theme.of(context).primaryTextTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 75),
          child: BlurButton(
              onPress: () {
                Navigator.pop(context);
                showDriverSetupBottomSheet(context);
              },
              label: "Started".tr(context)),
        )
      ],
    );
  }
}
