import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/View/Screens/My%20Payment%20Screen/my_wallet_screen.dart';

Future<bool> showNotEnoughBalanceDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => Dialog(
      
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.white)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: notEnoughBalanceWidget(context),
    ),
  );
}

Column notEnoughBalanceWidget(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            AssetManager.attention,
            height: 72,
            width: 72,
          ),
        ),
        Text(
          "notEnoughBalance".tr(context),
          style: Theme.of(context).primaryTextTheme.headline1!,
        ),
        Text(
          "notEnoughBalanceSub".tr(context),
          style: Theme.of(context).primaryTextTheme.caption!,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  "no".tr(context),
                  style: Theme.of(context).primaryTextTheme.headline4!,
                )),
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyWalletScreen())),
                child: Text(
                  "yes".tr(context),
                  style: Theme.of(context).primaryTextTheme.subtitle2!,
                ))
          ],
        )
      ],
    );
