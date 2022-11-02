// ignore_for_file: public_member_api_docs, sort_constructors_firstRecoveryOtpScreen
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khedni_m3k/Core/Core/utils/app_router.dart';
import 'package:pinput/pinput.dart';

import 'package:khedni_m3k/Core/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';

class RecoveryOtpScreen extends StatelessWidget {
  const RecoveryOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController pinController = TextEditingController();
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recovery",
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            Text(
              "Enter the recovery code you received",
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Pinput(
                    onCompleted: (value) =>
                        Navigator.pushNamed(context, AppRouter.newPassRoute),
                    controller: pinController,
                    defaultPinTheme: PinTheme(
                        width: context.width / 8,
                        textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF000000)),
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
                  "You didn't recive the code ! Resend it .",
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.grey.shade200)
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyBoardNum(
                        num: 1,
                        onpress: () {
                          pinController.text += "1";
                        },
                      ),
                      KeyBoardNum(
                        num: 2,
                        onpress: () {
                          pinController.text += "2";
                        },
                      ),
                      KeyBoardNum(
                        num: 3,
                        onpress: () {
                          pinController.text += "3";
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
                          pinController.text += "4";
                        },
                      ),
                      KeyBoardNum(
                        num: 5,
                        onpress: () {
                          pinController.text += "5";
                        },
                      ),
                      KeyBoardNum(
                        num: 6,
                        onpress: () {
                          pinController.text += "6";
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
                          pinController.text += "7";
                        },
                      ),
                      KeyBoardNum(
                        num: 8,
                        onpress: () {
                          pinController.text += "8";
                        },
                      ),
                      KeyBoardNum(
                        num: 9,
                        onpress: () {
                          pinController.text += "9";
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
                          pinController.text += "0";
                        },
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        onPressed: () {
                          pinController.clear();
                        },
                        mini: true,
                        elevation: 0,
                        child: SvgPicture.asset(
                          AssetManager.undo,
                          height: 30,
                          width: 30,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
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
