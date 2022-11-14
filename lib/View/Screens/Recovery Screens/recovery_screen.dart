// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import '../../../Core/utils/Global Widgets/blur_button.dart';
import '../../../Core/utils/app_router.dart';
import 'Widgets/global_text_form.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({Key? key}) : super(key: key);

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  late TextEditingController recoveryPhoneController;
  @override
  void initState() {
    recoveryPhoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    recoveryPhoneController.dispose();
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
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
              "RecoverySub".tr(context),
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 80.h),
              child: GlobalTextForm(
                controller: recoveryPhoneController,
                isReadOnly: false,
                onTap: () {},
                suffix: const SizedBox(),
                keyBoardType: TextInputType.phone,
                label: "PhoneNumber".tr(context),
                obSecure: false,
              ),
            ),
            SizedBox(
              height: 168.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "confirmedNumber".tr(context),
                style: Theme.of(context).primaryTextTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            BlurButton(
                onPress: () {
                  // Provider.of<RcoveryProvider>(context)
                  //     .setRecoverynumber(recoveryPhoneController.text);
                  Navigator.pushNamed(context, AppRouter.recoverotpRoute);
                },
                label: "GetCode".tr(context))
          ],
        ),
      ),
    );
  }
}
