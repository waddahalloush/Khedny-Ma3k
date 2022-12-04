// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View%20Model/driver_setup_provider.dart';
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
      constraints: BoxConstraints(maxHeight: context.height - 30),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        width: context.width,
        height: context.height,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(35))),
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
      child: Consumer<DriverSetupProvider>(builder: (context, myType, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                width: 35.w,
                height: 5.w,
                decoration: BoxDecoration(
                    color: const Color(0XFFE4E6E9),
                    borderRadius: BorderRadius.circular(2.5)),
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              title: Text("Become".tr(context),
                  style: Theme.of(context).primaryTextTheme.headline3),
              centerTitle: true,
            ),
            SizedBox(
              height: 10.h,
            ),
            myType.driverimage != null
                ? CircleAvatar(
                    radius: 50.r,
                    backgroundImage: FileImage(
                      myType.driverimage!,
                    ),
                  )
                : Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC4C4C4),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(blurRadius: 5, color: Colors.grey),
                      ],
                    ),
                  ),
            SizedBox(
              height: 10.h,
            ),
            TextButton(
              onPressed: () {
                myType.upLoadImage(context);
              },
              child: Text(
                "AddProfImg".tr(context),
                style: TextStyle(
                    color: const Color(0XFF406C96),
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: GlobalTextForm(
                  controller: fNameController,
                  isReadOnly: false,
                  onTap: () {},
                  label: "FName".tr(context),
                  obSecure: false,
                  suffix: const SizedBox(),
                  keyBoardType: TextInputType.name),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GlobalTextForm(
                  controller: lNameController,
                  isReadOnly: false,
                  onTap: () {},
                  label: "LName".tr(context),
                  obSecure: false,
                  suffix: const SizedBox(),
                  keyBoardType: TextInputType.name),
            ),
            SizedBox(
              height: 10.h,
            ),
            GlobalBubbleTextForm(
                controller: driverLicenceController,
                isReadOnly: true,
                onTap: () {
                 myType.upLoadLicenseImage(context);
                },
                hint: "License".tr(context),
                suffix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                            Icons.policy_rounded,
                            color: Colors.blue,
                          ),
                      myType.licenseimage != null
                          ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.close,
                              color: Theme.of(context).primaryColorLight,
                            ),
                    ],
                  ),
                )),
            GlobalBubbleTextForm(
              controller: whatsAppController,
              hint: "WhatsApp".tr(context),
              isReadOnly: false,
              onTap: () {},
              suffix: const Icon(
                Icons.whatsapp,
                color: Colors.green,
              ),
            ),
            GlobalBubbleTextForm(
              controller: telegramController,
              isReadOnly: false,
              onTap: () {},
              hint: "Telegram".tr(context),
              suffix: const Icon(
                Icons.telegram_outlined,
                color: Color(0XFF406C96),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              height: context.height * 0.18,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 5.h),
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
                        color: Theme.of(context).scaffoldBackgroundColor),
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
                  label: "Next".tr(context)),
            )
          ],
        );
      }),
    );
  }
}
