import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/Core/Core/utils/app_router.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 17),
        child: Column(
          children: [
            Container(
              width: context.width,
              height: context.height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFD6D6D6)),
            ),
            const SizedBox(
              height: 43,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Create an Account with your\nphone number",
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
            ),
            const SizedBox(
              height: 43,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Number Phone",
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
              height: 43,
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
