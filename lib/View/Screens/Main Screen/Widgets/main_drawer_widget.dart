// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/user_account_drawer_widget.dart';
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
            child: Column(
              children: [
                const UserAccountDrawerWidget(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Divider(),
                ),
                DrawerListTileWidget(
                  title: "Dashboard".tr(context),
                  icon: AssetManager.dashBoard,
                  ontap: () {},
                ),
                DrawerListTileWidget(
                  title: "Myride".tr(context),
                  icon: AssetManager.myRide,
                  ontap: () {},
                ),
                DrawerListTileWidget(
                  title: "Mypayment".tr(context),
                  icon: AssetManager.payment,
                  ontap: () {},
                ),
                DrawerListTileWidget(
                  title: "Myvehicles".tr(context),
                  icon: AssetManager.myVehicles,
                  ontap: () {},
                ),
                DrawerListTileWidget(
                  title: "Chat".tr(context),
                  icon: AssetManager.chat,
                  ontap: () {},
                ),
                DrawerListTileWidget(
                  title: "About".tr(context),
                  icon: AssetManager.about,
                  ontap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
