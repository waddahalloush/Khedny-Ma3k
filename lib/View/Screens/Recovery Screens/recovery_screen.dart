// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/Core/Core/utils/app_router.dart';

import 'Widgets/global_text_form.dart';

class RecoveryScreen extends StatelessWidget {
  const RecoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //from Theme Data
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recovery",
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Enter Phone Number to receive recovery code",
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: GlobalTextForm(
                suffix: const SizedBox(),
                controller: controller,
                keyBoardType: TextInputType.phone,
                label: "Phone Number",
                obSecure: false,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Make sure you confirmed your Number.\n By pressing button below, you'll get an SMS \n with recovery code. Input this code on the \n next page to reset your password",
                style: Theme.of(context).primaryTextTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80, top: 40),
              child: BlurButton(
                  onPress: () {
                    Navigator.pushNamed(context, AppRouter.otpRoute);
                  },
                  label: "Get The Code"),
            )
          ],
        ),
      ),
    );
  }
}