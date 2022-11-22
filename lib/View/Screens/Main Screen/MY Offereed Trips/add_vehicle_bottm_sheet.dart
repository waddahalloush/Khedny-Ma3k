// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:flutter_material_pickers/helpers/show_swatch_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/View%20Model/add_vehicle_provider.dart';
import 'package:khedni_m3k/View%20Model/app_provider.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:provider/provider.dart';

import '../../../../Core/constants/asset_manager.dart';
import '../../../../Core/utils/Global Widgets/blur_button.dart';
import '../../Recovery Screens/Widgets/global_text_form.dart';

void showAddVehicleBottomSheet(
  BuildContext context,
) =>
    showModalBottomSheet(
      barrierColor: Colors.black45,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      constraints: BoxConstraints(maxHeight: context.height - 80),
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
  late TextEditingController carModelController;
  late TextEditingController plateNumController;
  late TextEditingController colorController;
  late TextEditingController yearMakeController;
  late TextEditingController seatsController;
  @override
  void initState() {
    carModelController = TextEditingController();
    plateNumController = TextEditingController();
    colorController = TextEditingController();
    yearMakeController = TextEditingController();
    seatsController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    carModelController.dispose();
    plateNumController.dispose();
    colorController.dispose();
    yearMakeController.dispose();
    seatsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<AddVehicleProvider>(
        builder: (context, myType, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  width: 35.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      color: const Color(0XFFE4E6E9),
                      borderRadius: BorderRadius.circular(2.5.r)),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: myType.carimage == null
                    ? Image.asset(
                        AssetManager.sedan,
                        width: 100.w,
                        height: 80.h,
                      )
                    : CircleAvatar(
                        radius: 50.r,
                        backgroundImage: FileImage(myType.carimage!),
                      ),
              ),
              TextButton(
                onPressed: () {
                  myType.upLoadImage(context);
                },
                child: Text(
                  "UploadPhoto".tr(context),
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
                    controller: carModelController,
                    isReadOnly: false,
                    onTap: () {},
                    label: "CarModel".tr(context),
                    obSecure: false,
                    suffix: const SizedBox(),
                    keyBoardType: TextInputType.name),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: GlobalTextForm(
                    controller: plateNumController,
                    isReadOnly: false,
                    onTap: () {},
                    label: "PlateNum".tr(context),
                    obSecure: false,
                    suffix: const SizedBox(),
                    keyBoardType: TextInputType.name),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  children: [
                    Expanded(
                      child: GlobalTextForm(
                          controller: colorController,
                          isReadOnly: true,
                          onTap: () {
                            showMaterialSwatchPicker(
                              context: context,
                              selectedColor: Colors.black,
                              onChanged: (value) {
                                switch (value.value) {
                                  case 4294198070:
                                    colorController.text = "Deep Red";
                                    break;
                                  case 4293467747:
                                    colorController.text = "Red";
                                    break;
                                  case 4288423856:
                                    colorController.text = "Pink";
                                    break;
                                  case 4284955319:
                                    colorController.text = "Purple";
                                    break;
                                  case 4282339765:
                                    colorController.text = "Deep Blue";
                                    break;
                                  case 4280391411:
                                    colorController.text = "Blue";
                                    break;
                                  case 4278430196:
                                    colorController.text = "Light Blue";
                                    break;
                                  case 4278238420:
                                    colorController.text = "Green Blue";
                                    break;
                                  case 4278228616:
                                    colorController.text = "Deep Green";
                                    break;
                                  case 4283215696:
                                    colorController.text = "Green";
                                    break;
                                  case 4287349578:
                                    colorController.text = "Light Green";
                                    break;
                                  case 4291681337:
                                    colorController.text = "Phosphoric";
                                    break;
                                  case 4294961979:
                                    colorController.text = "Yellow";
                                    break;
                                  case 4294951175:
                                    colorController.text = "Light Orange";
                                    break;
                                  case 4394940672:
                                    colorController.text = "Orange";
                                    break;
                                  case 4294924066:
                                    colorController.text = "Deep Orange";
                                    break;
                                  case 4286141768:
                                    colorController.text = "Brown";
                                    break;
                                  case 4288585374:
                                    colorController.text = "Gray";
                                    break;
                                  case 4284513675:
                                    colorController.text = "Blue Gray";
                                    break;

                                  default:
                                    colorController.text = "Black";
                                }
                              },
                            );
                          },
                          label: "Color".tr(context),
                          obSecure: false,
                          suffix: const SizedBox(),
                          keyBoardType: TextInputType.name),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: GlobalTextForm(
                          controller: yearMakeController,
                          isReadOnly: true,
                          onTap: () {
                            showMaterialNumberPicker(
                                context: context,
                                minNumber: 1990,
                                onChanged: (value) =>
                                    yearMakeController.text = value.toString(),
                                maxNumber: 2023);
                          },
                          label: "YearMake".tr(context),
                          obSecure: false,
                          suffix: const SizedBox(),
                          keyBoardType: TextInputType.name),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: context.width / 2 + 60,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Image.asset(
                          AssetManager.group,
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                      Expanded(
                        child: Consumer<AppProvider>(
                          builder: (context, myType, child) {
                            return TextFormField(
                              style:
                                  Theme.of(context).primaryTextTheme.headline3,
                              onTap: () {
                                showMaterialNumberPicker(
                                    context: context,
                                    title: 'SeatsNum'.tr(context),
                                    maxNumber: 5,
                                    minNumber: 1,
                                    selectedNumber: 1,
                                    onChanged: (value) {
                                      seatsController.text = value.toString();
                                    });
                              },
                              readOnly: true,
                              showCursor: true,
                              controller: seatsController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  floatingLabelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption,
                                  hintText: "SeatsNum".tr(context),
                                  hintStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  labelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption),
                              keyboardType: TextInputType.datetime,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(30.w),
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        gradient: const LinearGradient(
                            colors: [Color(0xFF4776A2), Color(0xFF025099)])),
                    child: Checkbox(
                      value: myType.airCondition,
                      activeColor: Colors.transparent,
                      onChanged: (val) {
                        myType.changeairCondition(val!);
                      },
                    ),
                  ),
                  Text(
                    "Aircondation".tr(context),
                    style: Theme.of(context).primaryTextTheme.headline3,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BlurButton(
                    onPress: () {
                      Navigator.pop(context);
                    },
                    label: "AddCar".tr(context)),
              )
            ],
          );
        },
      ),
    );
  }
}
