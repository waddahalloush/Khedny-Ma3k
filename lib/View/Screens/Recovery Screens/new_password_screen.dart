import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Controller/app_provider.dart';
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
                  "New Password",
                  style: Theme.of(context).primaryTextTheme.headline1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your new password",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Consumer<AppProvider>(
                    builder: (context, value, child) => GlobalTextForm( isReadOnly: false,
                    onTap: () {},
                      suffix: IconButton(
                          onPressed: () {
                            value.changeVisible1();
                          },
                          icon: value.isVisible1
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
              
                      keyBoardType: TextInputType.phone,
                      label: "New Password",
                      obSecure: value.isVisible1 ? false : true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Consumer<AppProvider>(
                    builder: (context, value, child) => GlobalTextForm( isReadOnly: false,
                    onTap: () {},
                      suffix: IconButton(
                          onPressed: () {
                            value.changeVisible2();
                          },
                          icon: value.isVisible2
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                    
                      keyBoardType: TextInputType.phone,
                      label: "Confirm",
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
                      label: "Confirm"),
                )
              ],
            )));
  }
}
