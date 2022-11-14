// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Find%20Trip/search_result_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import '../../../../Core/constants/asset_manager.dart';
import '../../../../Core/utils/Global Widgets/blur_button.dart';
import '../../../../View Model/find_trip_provider.dart';
import '../Widgets/find_ride_form_widget.dart';
import '../Widgets/main_app_bar_widget.dart';

class FindTripScreen extends StatefulWidget {
  const FindTripScreen({Key? key}) : super(key: key);

  @override
  State<FindTripScreen> createState() => _FindTripScreenState();
}

class _FindTripScreenState extends State<FindTripScreen> {
  late TextEditingController originController;
  late TextEditingController distinationController;
  late TextEditingController dateController;
  late TextEditingController pepoleController;
  @override
  void initState() {
    originController = TextEditingController();
    distinationController = TextEditingController();
    dateController = TextEditingController();
    pepoleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    originController.dispose();
    distinationController.dispose();
    dateController.dispose();
    pepoleController.dispose();
    super.dispose();
  }

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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AssetManager.mediumProgress,
                              width: 16,
                              height: 72,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                FindRideFormWidget(
                                  controller: originController,
                                  color: Theme.of(context).primaryColor,
                                  hint: "Location".tr(context),
                                ),
                                FindRideFormWidget(
                                  controller: distinationController,
                                  color: Theme.of(context).primaryColorLight,
                                  hint: "Destination".tr(context),
                                ),
                              ],
                            )),
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
                                child: TextFormField(
                              onTap: () {
                                showMaterialDatePicker(
                                    context: context,
                                    onChanged: (val) {
                                      dateController.text =
                                          "${val.year}/${val.month}/${val.day}";
                                    },
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2025),
                                    selectedDate: DateTime.now());
                              },
                              readOnly: true,
                              showCursor: true,
                              style: const TextStyle(fontSize: 13),
                              controller: dateController,
                              decoration: InputDecoration(
                                  floatingLabelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption,
                                  hintText: "Picktime".tr(context),
                                  hintStyle: const TextStyle(fontSize: 18),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  labelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption),
                              keyboardType: TextInputType.datetime,
                            )),
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
                                child: TextFormField(
                              style: const TextStyle(fontSize: 13),
                              onTap: () {
                                showMaterialNumberPicker(
                                    context: context,
                                    title: "NumPeople".tr(context),
                                    maxNumber: 5,
                                    minNumber: 1,
                                    selectedNumber: 1,
                                    onChanged: (val) {
                                      pepoleController.text = val.toString();
                                    });
                              },
                              readOnly: true,
                              showCursor: true,
                              controller: pepoleController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  floatingLabelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption,
                                  hintText: "NumPeople".tr(context),
                                  hintStyle: const TextStyle(fontSize: 18),
                                  labelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption),
                              keyboardType: TextInputType.datetime,
                            )),
                          ],
                        ),
                        Consumer<FindTripProvider>(
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
                                  child: Text(
                                    "Door".tr(context),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline3,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                        BlurButton(
                            onPress: () {
                              // Provider.of<FindTripProvider>(context).searchTrip(
                              //     originController.text,
                              //     distinationController.text,
                              //     dateController.text,
                              //     pepoleController.text);
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
