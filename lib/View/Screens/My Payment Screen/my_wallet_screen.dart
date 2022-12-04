// ignore_for_file: public_member_api_docs, sort_constructors_firstMyWalletScreen
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/View/Screens/My%20Payment%20Screen/sender_screen.dart';

import '../../../Core/constants/asset_manager.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("My Wallet"),
        elevation: 2,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AssetManager.banner,
                height: 80.h,
                fit: BoxFit.contain,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "QuickWallet".tr(context),
                    style: const TextStyle(
                        fontSize: 13,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    "43.64 ${"Points".tr(context)}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ],
              )
            ],
          ),
          Text(
            "trans".tr(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              PaymentMethodWidget(
                paymentMethodImage: AssetManager.haram,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SenderScreen(
                            transferCompanyImg: AssetManager.haram,
                            transferCompanyname: "Al Haram"),
                      ));
                },
              ),
              PaymentMethodWidget(
                paymentMethodImage: AssetManager.kadmous,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SenderScreen(
                            transferCompanyImg: AssetManager.kadmous,
                            transferCompanyname: "Al Kadmous"),
                      ));
                },
              ),
              PaymentMethodWidget(
                paymentMethodImage: AssetManager.fouad,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SenderScreen(
                            transferCompanyImg: AssetManager.fouad,
                            transferCompanyname: "Al Fouad"),
                      ));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  final String paymentMethodImage;
  final VoidCallback onTap;
  const PaymentMethodWidget({
    Key? key,
    required this.paymentMethodImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            paymentMethodImage,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
