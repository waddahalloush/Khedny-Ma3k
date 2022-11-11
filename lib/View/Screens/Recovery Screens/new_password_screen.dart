import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../View Model/app_provider.dart';
import '../../../Core/utils/Global Widgets/blur_button.dart';
import '../../../Core/utils/app_router.dart';
import 'Widgets/global_text_form.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "NewPassword".tr(context),
                  style: Theme.of(context).primaryTextTheme.headline1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "NewPasswordSub".tr(context),
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Consumer<AppProvider>(
                    builder: (context, value, child) => GlobalTextForm(
                      isReadOnly: false,
                      onTap: () {},
                      suffix: IconButton(
                          onPressed: () {
                            value.changeVisible1();
                          },
                          icon: value.isVisible1
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      keyBoardType: TextInputType.phone,
                      label: "NewPassword".tr(context),
                      obSecure: value.isVisible1 ? false : true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Consumer<AppProvider>(
                    builder: (context, value, child) => GlobalTextForm(
                      isReadOnly: false,
                      onTap: () {},
                      suffix: IconButton(
                          onPressed: () {
                            value.changeVisible2();
                          },
                          icon: value.isVisible2
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      keyBoardType: TextInputType.phone,
                      label: "Confirm".tr(context),
                      obSecure: value.isVisible2 ? false : true,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80, top: 40),
                  child: BlurButton(
                      onPress: () {
                        Navigator.of(context).pushNamed(AppRouter.mainRoute);
                      },
                      label: "Confirm".tr(context)),
                )
              ],
            )));
  }
}
