// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View%20Model/app_provider.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/user_account_drawer_widget.dart';
import 'package:provider/provider.dart';
import '../../../../Core/constants/asset_manager.dart';
import 'drawer_list_tile_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Drawer(
          elevation: 2,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          width: context.width - 50,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Consumer<AppProvider>(
                builder: (context, myType, child) {
                  return Column(
                    children: [
                      const UserAccountDrawerWidget(),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Divider(),
                      ),
                      DrawerListTileWidget(
                        title: "Dashboard".tr(context),
                        icon: Image.asset(
                          AssetManager.dashBoard,
                          height: 35,
                          width: 30,
                        ),
                        ontap: () {},
                      ),
                      DrawerListTileWidget(
                        title: "Myride".tr(context),
                        icon: Image.asset(
                          AssetManager.myRide,
                          height: 35,
                          width: 30,
                        ),
                        ontap: () {},
                      ),
                      DrawerListTileWidget(
                        title: "Mypayment".tr(context),
                        icon: Image.asset(
                          AssetManager.payment,
                          height: 35,
                          width: 30,
                        ),
                        ontap: () {},
                      ),
                      DrawerListTileWidget(
                        title: "Myvehicles".tr(context),
                        icon: Image.asset(
                          AssetManager.myVehicles,
                          height: 35,
                          width: 30,
                        ),
                        ontap: () {},
                      ),
                      DrawerListTileWidget(
                        title: "Chat".tr(context),
                        icon: Image.asset(
                          AssetManager.chat,
                          height: 35,
                          width: 30,
                        ),
                        ontap: () {},
                      ),
                      // DrawerListTileWidget(
                      //   title: "theme".tr(context),
                      //   icon: FlutterSwitch(
                      //     activeColor: const Color(0XFF877EF2),
                      //     activeIcon: const Icon(Icons.nightlight_round),
                      //     inactiveColor: Colors.amber,
                      //     inactiveIcon: const Icon(Icons.sunny),
                      //     value: myType.isDark,
                      //     onToggle: (value) => myType.setAppTheme(value),
                      //   ),
                      //   ontap: () {},
                      // ),
                      // DrawerListTileWidget(
                      //   title: "lang".tr(context),
                      //   icon: FlutterSwitch(
                      //     height: 35,
                      //     width: 30,
                      //     value: myType.isDark,
                      //     onToggle: (value) =>
                      //         myType.setApplang(value ? "en" : "ar"),
                      //   ),
                      //   ontap: () {},
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            FlutterSwitch(
                              onToggle: (value) {
                                myType.setAppTheme(value);
                              },
                              activeColor: const Color(0XFF877EF2),
                              inactiveColor: Colors.amber,
                              activeIcon: const Icon(
                                Icons.nightlight_round,
                                size: 12,
                                color: Color(0XFF877EF2),
                              ),
                              inactiveIcon: const Icon(
                                Icons.sunny,
                                color: Colors.amber,
                                size: 12,
                              ),
                              value: myType.isDark,
                              width: 45,
                              height: 27,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "theme".tr(context),
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline1,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            FlutterSwitch(
                              onToggle: (value) {
                                myType.setApplang(value ? "en" : "ar");
                              },
                              activeColor: const Color(0XFF004E98),
                              inactiveColor: const Color(0XFF004E98),
                              activeIcon: const Text(
                                "EN",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              inactiveIcon: const Text(
                                "AR",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              value: myType.lang == const Locale("ar")
                                  ? false
                                  : true,
                              width: 45,
                              height: 27,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "lang".tr(context),
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline1,
                              ),
                            )
                          ],
                        ),
                      ),
                      DrawerListTileWidget(
                        title: "About".tr(context),
                        icon: Image.asset(
                          AssetManager.about,
                          height: 35,
                          width: 30,
                        ),
                        ontap: () {},
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
