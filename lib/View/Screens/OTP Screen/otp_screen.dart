import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';
import 'package:pinput/pinput.dart';

import '../../../Core/Core/utils/app_router.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late CountdownTimerController controller;
  bool isCountDownComplete = false;
  void onEnd() {
    setState(() {
      isCountDownComplete = true;
    });
    controller.disposeTimer();
  }

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 5;
  @override
  void initState() {
    controller = CountdownTimerController(
      endTime: endTime,
      onEnd: onEnd,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 25),
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Please enter the 4 digit OTP\nsent to +62812 0101 0101",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF5E5E5E)),
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
              const Text(
                "Don't tell anyone the code",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF5E5E5E)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 37),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Expiring In",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF5E5E5E)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CountdownTimer(
                      controller: controller,
                      onEnd: onEnd,
                      endTime: endTime,
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 43),
                  child: TextButton(
                    onPressed: isCountDownComplete
                        ? () {
                            Navigator.popAndPushNamed(
                                context, AppRouter.otpRoute);
                          }
                        : () {},
                    child: Text("RESEND OTP",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Nunito",
                            color: isCountDownComplete
                                ? const Color.fromARGB(255, 59, 98, 238)
                                : Colors.grey)),
                  )),
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
