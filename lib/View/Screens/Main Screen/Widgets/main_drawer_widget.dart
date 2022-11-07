// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/user_account_drawer_widget.dart';
import 'drawer_list_tile_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        width: context.width - 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
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
                title: "Dashboard",
                icon: AssetManager.dashBoard,
                ontap: () {},
              ),
              DrawerListTileWidget(
                title: "My ride",
                icon: AssetManager.myRide,
                ontap: () {},
              ),
              DrawerListTileWidget(
                title: "My payment",
                icon: AssetManager.payment,
                ontap: () {},
              ),
              DrawerListTileWidget(
                title: "My vehicles",
                icon: AssetManager.myVehicles,
                ontap: () {},
              ),
              DrawerListTileWidget(
                title: "Chat",
                icon: AssetManager.chat,
                ontap: () {},
              ),
              DrawerListTileWidget(
                title: "About",
                icon: AssetManager.about,
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
