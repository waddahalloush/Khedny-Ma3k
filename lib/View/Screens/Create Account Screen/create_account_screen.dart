import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/Core/Core/utils/app_router.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 17),
        child: Column(
          children: [
            const SizedBox(
              height: 43,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Create an account with your\nphone number",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF000000)),
              ),
            ),
            const SizedBox(
              height: 43,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Phone number",
                style: Theme.of(context).primaryTextTheme.caption,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
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
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRouter.recoveryRoute);
                },
                child: Text("Recover Account",
                    style: Theme.of(context).primaryTextTheme.headline2)),
            const SizedBox(
              height: 40,
            ),
            BlurButton(
                onPress: () {
                  Navigator.pushNamed(context, AppRouter.otpRoute);
                },
                label: "Continue")
          ],
        ),
      ),
    ));
  }
}
