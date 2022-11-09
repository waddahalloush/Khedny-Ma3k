import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/driver_setup_bottom_sheet.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlurButton(onPress: () {}, label: "Become a Driver"),
            BlurButton(
                onPress: () {
                  showDriverSetupBottomSheet(context);
                },
                label: "Driver Setup"),
          ],
        ),
      ),
    );
  }
}
