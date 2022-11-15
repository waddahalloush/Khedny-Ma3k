import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../Core/utils/Global Widgets/blur_button.dart';
import '../../../Core/utils/app_router.dart';
import '../../../View Model/new_password_provider.dart';
import 'Widgets/global_text_form.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late TextEditingController newPassController;
  late TextEditingController confirmPassController;
  @override
  void initState() {
    newPassController = TextEditingController();
    confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    newPassController.dispose();
    confirmPassController.dispose();
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
        body: Form(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<NewPasswordProvider>(
                builder: (context, myType, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NewPassword".tr(context),
                        style: Theme.of(context).primaryTextTheme.headline1,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "NewPasswordSub".tr(context),
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 80.h),
                        child: GlobalTextForm(
                          controller: newPassController,
                          isReadOnly: false,
                          onTap: () {},
                          suffix: IconButton(
                              onPressed: () {
                                myType.changeVisible1();
                              },
                              icon: myType.isVisible1
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.blue,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.blue,
                                    )),
                          keyBoardType: TextInputType.phone,
                          label: "NewPassword".tr(context),
                          obSecure: myType.isVisible1 ? false : true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GlobalTextForm(
                          controller: confirmPassController,
                          isReadOnly: false,
                          onTap: () {},
                          suffix: IconButton(
                              onPressed: () {
                                myType.changeVisible2();
                              },
                              icon: myType.isVisible2
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.blue,
                                    )
                                  : const Icon(Icons.visibility_off,
                                      color: Colors.blue)),
                          keyBoardType: TextInputType.phone,
                          label: "Confirm".tr(context),
                          obSecure: myType.isVisible2 ? false : true,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 80, top: 40),
                        child: BlurButton(
                            onPress: () {
                              Navigator.of(context)
                                  .pushNamed(AppRouter.mainRoute);
                            },
                            label: "Confirm".tr(context)),
                      )
                    ],
                  );
                },
              )),
        ));
  }
}
