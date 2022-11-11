// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/View%20Model/app_provider.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Sub%20Screens/search_result_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import '../../../Core/constants/asset_manager.dart';
import '../../../Core/utils/Global Widgets/blur_button.dart';
import 'Widgets/find_ride_form_widget.dart';
import 'Widgets/main_app_bar_widget.dart';

class FindTripScreen extends StatelessWidget {
  const FindTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MainAppBarWidget(title: "FindTrip".tr(context)),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: context.width,
                height: context.height * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFD6D6D6)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 22),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: context.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(blurRadius: 6, color: Colors.grey.shade300)
                        ],
                        color: const Color(0xFFFFFFFF)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AssetManager.mediumProgress,
                              width: 16,
                              height: 72,
                            ),
                            Expanded(
                              child: Consumer<AppProvider>(
                                builder: (context, myType, child) {
                                  return Column(
                                    children: [
                                      FindRideFormWidget(
                                        controller: myType.sourceController,
                                        color: Theme.of(context).primaryColor,
                                        hint: "Location".tr(context),
                                      ),
                                      FindRideFormWidget(
                                        controller: myType.distController,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        hint: "Destination".tr(context),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.asset(
                                AssetManager.timer,
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Expanded(
                              child: Consumer<AppProvider>(
                                builder: (context, myType, child) {
                                  return TextFormField(
                                    onTap: () {
                                      showMaterialDatePicker(
                                          context: context,
                                          onChanged: (value) {
                                            myType.setTime(value);
                                          },
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2025),
                                          selectedDate: DateTime.now());
                                    },
                                    readOnly: true,
                                    showCursor: true,
                                    style: const TextStyle(fontSize: 13),
                                    controller: myType.timeController,
                                    decoration: InputDecoration(
                                        floatingLabelStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .caption,
                                        hintText: "Picktime".tr(context),
                                        hintStyle:
                                            const TextStyle(fontSize: 13),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10),
                                        labelStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .caption),
                                    keyboardType: TextInputType.datetime,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
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
                                    style: const TextStyle(fontSize: 13),
                                    onTap: () {
                                      showMaterialNumberPicker(
                                          context: context,
                                          title: "NumPeople".tr(context),
                                          maxNumber: 5,
                                          minNumber: 1,
                                          selectedNumber: 1,
                                          onChanged: (value) {
                                            myType.setNumOfPepole(value);
                                          });
                                    },
                                    readOnly: true,
                                    showCursor: true,
                                    controller: myType.numOfPepoleController,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10),
                                        floatingLabelStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .caption,
                                        hintText: "NumPeople".tr(context),
                                        hintStyle:
                                            const TextStyle(fontSize: 13),
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
                        Consumer<AppProvider>(
                          builder: (context, myType, child) {
                            return Row(
                              children: [
                                FlutterSwitch(
                                  onToggle: (value) {
                                    myType.changeSwicthDoor(value);
                                  },
                                  activeColor:
                                      Theme.of(context).primaryColorLight,
                                  value: myType.doorToDoor,
                                  width: 45,
                                  height: 24,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text("Door".tr(context)),
                                )
                              ],
                            );
                          },
                        ),
                        BlurButton(
                            onPress: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const SearchResultScreen(),
                                withNavBar: true,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            label: "Search".tr(context))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
