import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';
import 'package:pinput/pinput.dart';

import '../../../Core/Core/utils/app_router.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 25),
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Please enter the 4 digit OTP\nsent to +62812 0101 0101",
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 37, bottom: 47),
                  child: Pinput(
                    obscureText: true,
                    obscuringWidget: const CircleAvatar(
                        radius: 10, backgroundColor: Color(0XFF5E5E5E)),
                    onCompleted: (value) {},
                    defaultPinTheme: PinTheme(
                        width: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF000000)),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0XFFACACAC),
                            ))),
                  )),
              Text(
                "Don't tell anyone the code",
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 37),
                child: Text(
                  "Expiring In 04 : 59",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 43),
                child: Text(
                  "RESEND OTP",
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
              ),
              BlurButton(
                  onPress: () {
                    Navigator.pushNamed(context, AppRouter.mainRoute);
                  },
                  label: "Submit")
            ],
          ),
        ),
      ),
    );
  }
}