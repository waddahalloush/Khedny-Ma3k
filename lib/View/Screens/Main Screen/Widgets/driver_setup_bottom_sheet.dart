// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:khedni_m3k/Core/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/global_bubble_text_form.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/add_vehicle_bottm_sheet.dart';

import '../../Recovery Screens/Widgets/global_text_form.dart';
import 'car_widget.dart';

void showDriverSetupBottomSheet(
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
          AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
            title: Text("Become a Driver",
                style: Theme.of(context).primaryTextTheme.headline3),
            centerTitle: true,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: Color(0xFFC4C4C4),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(blurRadius: 5, color: Colors.grey),
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Add Profile Image",
            style: TextStyle(
                color: Color(0XFF406C96),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: GlobalTextForm(
                label: "First Name",
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
                label: "Last Name",
                obSecure: false,
                suffix: SizedBox(),
                keyBoardType: TextInputType.name),
          ),
          const SizedBox(
            height: 10,
          ),
          GlobalBubbleTextForm(
              hint: "Driver License",
              suffix: SvgPicture.asset(AssetManager.check)),
          const GlobalBubbleTextForm(
            hint: "WhatsApp",
            suffix: Icon(
              Icons.whatsapp,
              color: Colors.green,
            ),
          ),
          const GlobalBubbleTextForm(
            hint: "Telegram",
            suffix: Icon(
              Icons.telegram_outlined,
              color: Color(0XFF406C96),
            ),
          ),
          SizedBox(
            height: context.height * 0.22,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 15),
              scrollDirection: Axis.horizontal,
              children: [
                const CarWidget(
                  carImage: AssetManager.sedan,
                  carname: "Loyota i12",
                  carmodel: "MH12D1433",
                ),
                const CarWidget(
                  carImage: AssetManager.hatch,
                  carname: "Loyota i12",
                  carmodel: "MH12D1433",
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(blurRadius: 6, color: Colors.grey.shade300)
                      ],
                      color: const Color(0xFFFFFFFF)),
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 70,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlurButton(
                onPress: () {
                  Navigator.pop(context);
                  showAddVehicleBottomSheet(context);
                },
                label: "Next"),
          )
        ],
      ),
    );
  }
}
