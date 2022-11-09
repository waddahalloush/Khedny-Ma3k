// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:flutter_material_pickers/helpers/show_swatch_picker.dart';
import 'package:khedni_m3k/Controller/app_provider.dart';

import 'package:khedni_m3k/Core/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<AppProvider>(
        builder: (context, myType, child) {
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
                  myType.upLoadImage(context, false);
                },
                child: const Text(
                  "Upload Photo",
                  style: TextStyle(
                      color: Color(0XFF406C96),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GlobalTextForm(
                    isReadOnly: true,
                    onTap: () {},
                    label: "Car Model",
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
                    isReadOnly: true,
                    onTap: () {},
                    label: "Plate Number",
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
                          isReadOnly: true,
                          onTap: () {
                            showMaterialSwatchPicker(
                              context: context,
                              selectedColor: Colors.black,
                              onChanged: (value) {
                                log("$value");
                              },
                            );
                          },
                          label: "Color",
                          obSecure: false,
                          suffix: const SizedBox(),
                          keyBoardType: TextInputType.name),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GlobalTextForm(
                          isReadOnly: true,
                          onTap: () {
                            showDatePicker(
                                initialDatePickerMode: DatePickerMode.year,
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2023));
                          },
                          label: "Year Make",
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
                          child: Consumer<AppProvider>(
                            builder: (context, myType, child) {
                              return TextFormField(
                                onTap: () {
                                  showMaterialNumberPicker(
                                      context: context,
                                      title: 'Pick Number Of Seats',
                                      maxNumber: 5,
                                      minNumber: 1,
                                      selectedNumber: 1,
                                      onChanged: (value) {
                                        myType.setNumOfPepole(value);
                                      });
                                },
                                readOnly: true,
                                showCursor: true,
                                controller: myType.numSeatsController,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    floatingLabelStyle: Theme.of(context)
                                        .primaryTextTheme
                                        .caption,
                                    hintText: "Number of Seats",
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
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
          );
        },
      ),
    );
  }
}
