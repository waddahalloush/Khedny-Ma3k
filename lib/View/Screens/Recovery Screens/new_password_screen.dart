import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khedni_m3k/Controller/cubit/app_cubit.dart';

import '../../../Core/Core/utils/Global Widgets/blur_button.dart';
import 'Widgets/global_text_form.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController p1controller = TextEditingController();
    TextEditingController p2controller = TextEditingController();

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
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            var cubit = context.read<AppCubit>();
            return Column(
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
                  child: GlobalTextForm(
                    suffix: IconButton(
                        onPressed: () {
                          cubit.changeVisible1();
                        },
                        icon: cubit.visibleForm1
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    controller: p1controller,
                    keyBoardType: TextInputType.phone,
                    label: "New Password",
                    obSecure: cubit.visibleForm1 ? false : true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GlobalTextForm(
                    suffix: IconButton(
                        onPressed: () {
                          cubit.changeVisible2();
                        },
                        icon: cubit.visibleForm2
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    controller: p2controller,
                    keyBoardType: TextInputType.phone,
                    label: "Confirm",
                    obSecure: cubit.visibleForm2 ? false : true,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80, top: 40),
                  child: BlurButton(onPress: () {}, label: "Confirm"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
