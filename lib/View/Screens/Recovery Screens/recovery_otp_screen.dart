// ignore_for_file: public_member_api_docs, sort_constructors_firstRecoveryOtpScreen
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:pinput/pinput.dart';
import '../../../Core/constants/asset_manager.dart';
import '../../../Core/utils/app_router.dart';

class RecoveryOtpScreen extends StatefulWidget {
  const RecoveryOtpScreen({Key? key}) : super(key: key);

  @override
  State<RecoveryOtpScreen> createState() => _RecoveryOtpScreenState();
}

class _RecoveryOtpScreenState extends State<RecoveryOtpScreen> {
  late TextEditingController recoverypinController;
  @override
  void initState() {
    recoverypinController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    recoverypinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //from Theme Data
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
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
              "Recovery".tr(context),
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "ReciveRecovery".tr(context),
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Pinput(
                    onCompleted: (value) {
                      // Provider.of<RecoveryOtpProvider>(context)
                      //     .checkOtp(recoverypinController.text);
                      Navigator.pushNamed(context, AppRouter.mainRoute);
                    },
                    controller: recoverypinController,
                    defaultPinTheme: PinTheme(
                        width: context.width / 8,
                        textStyle: Theme.of(context).primaryTextTheme.headline3,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                                bottom: BorderSide(
                                    width: 3,
                                    color: Colors.deepPurpleAccent)))),
                  )),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Resend".tr(context),
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
              ),
            ),
            Expanded(
                child: CallNumberDialer(
                    recoverypinController: recoverypinController))
          ],
        ),
      ),
    );
  }
}

class CallNumberDialer extends StatelessWidget {
  const CallNumberDialer({
    Key? key,
    required this.recoverypinController,
  }) : super(key: key);

  final TextEditingController recoverypinController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade200)],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyBoardNum(
                num: 1,
                onpress: () {
                  recoverypinController.text += "1";
                },
              ),
              KeyBoardNum(
                num: 2,
                onpress: () {
                  recoverypinController.text += "2";
                },
              ),
              KeyBoardNum(
                num: 3,
                onpress: () {
                  recoverypinController.text += "3";
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyBoardNum(
                num: 4,
                onpress: () {
                  recoverypinController.text += "4";
                },
              ),
              KeyBoardNum(
                num: 5,
                onpress: () {
                  recoverypinController.text += "5";
                },
              ),
              KeyBoardNum(
                num: 6,
                onpress: () {
                  recoverypinController.text += "6";
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyBoardNum(
                num: 7,
                onpress: () {
                  recoverypinController.text += "7";
                },
              ),
              KeyBoardNum(
                num: 8,
                onpress: () {
                  recoverypinController.text += "8";
                },
              ),
              KeyBoardNum(
                num: 9,
                onpress: () {
                  recoverypinController.text += "9";
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                splashColor: Colors.transparent,
                onPressed: () {},
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              KeyBoardNum(
                num: 0,
                onpress: () {
                  recoverypinController.text += "0";
                },
              ),
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () {
                  recoverypinController.clear();
                },
                mini: true,
                elevation: 0,
                child: Image.asset(
                  AssetManager.remove,
                  height: 30,
                  width: 30,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class KeyBoardNum extends StatelessWidget {
  final int num;
  final VoidCallback onpress;
  const KeyBoardNum({
    Key? key,
    required this.num,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: onpress,
      backgroundColor: Colors.white,
      child: Text(
        num.toString(),
        style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Color(0xFF000000)),
      ),
    );
  }
}
