// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:khedni_m3k/Core/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';

import '../../Recovery Screens/Widgets/global_text_form.dart';

void showAddVehicleBottomSheet(
  BuildContext context,
) =>
    showModalBottomSheet(
      barrierColor: Colors.black45,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      constraints: BoxConstraints(maxHeight: context.height / 1.3),
      builder: (context) => Container(
        width: context.width,
        height: context.height,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
        child: const DriverSetupWidget(),
      ),
    );

class DriverSetupWidget extends StatelessWidget {
  const DriverSetupWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: 35,
            height: 5,
            decoration: BoxDecoration(
                color: const Color(0XFFE4E6E9),
                borderRadius: BorderRadius.circular(2.5)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              AssetManager.sedan,
              width: 100,
              height: 80,
            ),
          ),
          const Text(
            "Upload Photo",
            style: TextStyle(
                color: Color(0XFF406C96),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: GlobalTextForm(
                label: "Car Model",
                obSecure: false,
                suffix: SizedBox(),
                keyBoardType: TextInputType.name),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: GlobalTextForm(
                label: "Plate Number",
                obSecure: false,
                suffix: SizedBox(),
                keyBoardType: TextInputType.name),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: const [
                Expanded(
                  child: GlobalTextForm(
                      label: "Color",
                      obSecure: false,
                      suffix: SizedBox(),
                      keyBoardType: TextInputType.name),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GlobalTextForm(
                      label: "Year Make",
                      obSecure: false,
                      suffix: SizedBox(),
                      keyBoardType: TextInputType.name),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: context.width / 2 + 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset(
                        AssetManager.group,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            floatingLabelStyle:
                                Theme.of(context).primaryTextTheme.caption,
                            hintText: "Number of Seats",
                            labelStyle:
                                Theme.of(context).primaryTextTheme.caption),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(30),
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    gradient: const LinearGradient(
                        colors: [Color(0xFF4776A2), Color(0xFF025099)])),
                child: Checkbox(
                  value: true,
                  activeColor: Colors.transparent,
                  onChanged: (val) {},
                ),
              ),
              const Text(
                "Air conditioning",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            width: context.width,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(blurRadius: 6, color: Colors.grey.shade300)
                ],
                color: const Color(0xFFFFFFFF)),
            child: BlurButton(
                onPress: () {
                  Navigator.pop(context);
                },
                label: "Add Car"),
          )
        ],
      ),
    );
  }
}
