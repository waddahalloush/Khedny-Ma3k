// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:khedni_m3k/View%20Model/app_provider.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/MY%20Offereed%20Trips/add_vehicle_bottm_sheet.dart';
import 'package:provider/provider.dart';

import '../../../../Core/constants/asset_manager.dart';
import '../../../../Core/utils/Global Widgets/blur_button.dart';
import '../../../../Core/utils/Global Widgets/global_bubble_text_form.dart';
import '../Widgets/car_widget.dart';
import '../../Recovery Screens/Widgets/global_text_form.dart';

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

class DriverSetupWidget extends StatefulWidget {
  const DriverSetupWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DriverSetupWidget> createState() => _DriverSetupWidgetState();
}

class _DriverSetupWidgetState extends State<DriverSetupWidget> {
    late TextEditingController fNameController;
  late TextEditingController lNameController;
  late TextEditingController whatsAppController;
  late TextEditingController telegramController;
  late TextEditingController driverLicenceController;
  @override
  void initState() {
    fNameController = TextEditingController();
    lNameController = TextEditingController();
    whatsAppController = TextEditingController();
    telegramController = TextEditingController();
    driverLicenceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    whatsAppController.dispose();
    telegramController.dispose();
    driverLicenceController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<AppProvider>(builder: (context, myType, child) {
        return Column(
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
            myType.driverimage != null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(
                      myType.driverimage!,
                    ),
                  )
                : Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC4C4C4),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(blurRadius: 5, color: Colors.grey),
                      ],
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                myType.upLoadImage(context, true);
              },
              child: const Text(
                "Add Profile Image",
                style: TextStyle(
                    color: Color(0XFF406C96),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GlobalTextForm(controller: fNameController,
                  isReadOnly: false,
                  onTap: () {},
                  label: "First Name",
                  obSecure: false,
                  suffix: const SizedBox(),
                  keyBoardType: TextInputType.name),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GlobalTextForm(controller: lNameController,
                  isReadOnly: false,
                  onTap: () {},
                  label: "Last Name",
                  obSecure: false,
                  suffix: const SizedBox(),
                  keyBoardType: TextInputType.name),
            ),
            const SizedBox(
              height: 10,
            ),
            GlobalBubbleTextForm(controller: driverLicenceController,
              isReadOnly: true,
              onTap: () {
                myType.changeDriverLicense();
              },
              hint: "Driver License",
              suffix: myType.driverLicense
                  ? Icon(
                      Icons.check,
                      color: Theme.of(context).primaryColor,
                    )
                  : Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColorLight,
                    ),
            ),
            GlobalBubbleTextForm(controller: whatsAppController,
              hint: "WhatsApp",
              isReadOnly: false,
              onTap: () {},
              suffix: const Icon(
                Icons.whatsapp,
                color: Colors.green,
              ),
            ),
            GlobalBubbleTextForm(controller: telegramController,
              isReadOnly: false,
              onTap: () {},
              hint: "Telegram",
              suffix: const Icon(
                Icons.telegram_outlined,
                color: Color(0XFF406C96),
              ),
            ),
            SizedBox(
              height: context.height * 0.22,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 5),
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
        );
      }),
    );
  }
}
