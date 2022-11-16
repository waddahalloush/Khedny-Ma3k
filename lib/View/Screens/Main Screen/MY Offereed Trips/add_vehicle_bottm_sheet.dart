// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:flutter_material_pickers/helpers/show_swatch_picker.dart';
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
      constraints: BoxConstraints(maxHeight: context.height / 1.2),
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
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: 35,
                  height: 5,
                  decoration: BoxDecoration(
                      color: const Color(0XFFE4E6E9),
                      borderRadius: BorderRadius.circular(2.5)),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: myType.carimage == null
                    ? Image.asset(
                        AssetManager.sedan,
                        width: 100,
                        height: 80,
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(myType.carimage!),
                      ),
              ),
              TextButton(
                onPressed: () {
                  myType.upLoadImage(context);
                },
                child: Text(
                  "UploadPhoto".tr(context),
                  style: const TextStyle(
                      color: Color(0XFF406C96),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GlobalTextForm(
                    controller: carModelController,
                    isReadOnly: true,
                    onTap: () {},
                    label: "CarModel".tr(context),
                    obSecure: false,
                    suffix: const SizedBox(),
                    keyBoardType: TextInputType.name),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GlobalTextForm(
                    controller: plateNumController,
                    isReadOnly: true,
                    onTap: () {},
                    label: "PlateNum".tr(context),
                    obSecure: false,
                    suffix: const SizedBox(),
                    keyBoardType: TextInputType.name),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
                    const SizedBox(
                      width: 10,
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: context.width / 2 + 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Image.asset(
                          AssetManager.group,
                          width: 30,
                          height: 30,
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
                                  hintStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3,
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
                    margin: const EdgeInsets.all(30),
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
