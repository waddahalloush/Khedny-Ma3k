import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../Core/utils/Global Widgets/blur_button.dart';
import '../../../Core/utils/app_router.dart';
import '../../../View Model/create_account_provider.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 85.h,
            ),
            Text(
              "Createaccount".tr(context),
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "PhoneNumber".tr(context),
              style: Theme.of(context).primaryTextTheme.caption,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              style: Theme.of(context).primaryTextTheme.headline3,
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: InputDecoration(
                  hintText: "+62812 0101 0101",
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey,
                  )),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: 18.sp, fontFamily: 'Cairo'),
                  suffixIcon: const Icon(Icons.phone_iphone_rounded),
                  suffixIconColor: Theme.of(context).primaryColor,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
            ),
            SizedBox(
              height: 95.h,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRouter.recoveryRoute);
                  },
                  child: Text("RecoverAccount".tr(context),
                      style: Theme.of(context).primaryTextTheme.headline1)),
            ),
            SizedBox(
              height: 95.h,
            ),
            BlurButton(
                onPress: () {
                  Provider.of<CreateAccountProvider>(context, listen: false)
                      .createAccount(phoneController.text);
                  Navigator.pushNamed(context, AppRouter.otpRoute);
                },
                label: "Continue".tr(context))
          ],
        ),
      ),
    ));
  }
}
