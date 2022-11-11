import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';

import '../../../Core/utils/Global Widgets/blur_button.dart';
import '../../../Core/utils/app_router.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late TextEditingController phoneController;
  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 43,
            ),
            Text(
              "Createaccount".tr(context),
              style: const TextStyle(
                  fontSize: 22,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF000000)),
            ),
            const SizedBox(
              height: 43,
            ),
            Text(
              "PhoneNumber".tr(context),
              style: Theme.of(context).primaryTextTheme.caption,
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: InputDecoration(
                  hintText: "+62812 0101 0101",
                  enabledBorder: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(),
                  hintStyle: const TextStyle(
                      color: Color(0XFF5E5E5E),
                      fontSize: 18,
                      fontFamily: 'Nunito'),
                  suffixIcon: const Icon(Icons.phone_iphone_rounded),
                  suffixIconColor: Theme.of(context).primaryColor,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRouter.recoveryRoute);
                  },
                  child: Text("RecoverAccount".tr(context),
                      style: Theme.of(context).primaryTextTheme.headline2)),
            ),
            const SizedBox(
              height: 40,
            ),
            BlurButton(
                onPress: () {
                  Navigator.pushNamed(context, AppRouter.otpRoute);
                },
                label: "Continue".tr(context))
          ],
        ),
      ),
    ));
  }
}
