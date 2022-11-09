import 'package:flutter/material.dart';
import 'package:khedni_m3k/Controller/app_provider.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/become_driver_modal.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/main_drawer_widget.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/my_trip_screen.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/my_offered_trip_screen.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/find_trip.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/message_screen.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import '../../../Core/constants/asset_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    List<Widget> screens = [
      const FindTripScreen(),
      const MyOfferedTripScreen(),
      const MyTripScreen(),
      const MessageScreen(),
      const ProfileScreen(),
    ];
    return Consumer<AppProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        key: value.scaffoldKey,
        drawer: const MainDrawerWidget(),
        body: PersistentTabView(
          onItemSelected: (value) {
            value == 1
                ? showBecomeDriverBottomSheet(context)
                : controller.jumpToTab(value);
          },
          context,
          controller: controller,
          screens: screens,
          items: [
            PersistentBottomNavBarItem(
                icon: const Icon(
                  UniconsLine.estate,
                ),
                activeColorPrimary: Theme.of(context).primaryColor,
                inactiveColorPrimary: Theme.of(context).primaryColorDark,
                iconSize: 20),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.time_to_leave_outlined),
                activeColorPrimary: Theme.of(context).primaryColor,
                inactiveColorPrimary: Theme.of(context).primaryColorDark,
                iconSize: 20),
            PersistentBottomNavBarItem(
              icon: Image.asset(
                AssetManager.fab,
                width: 50,
                height: 50,
              ),
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(UniconsLine.comment),
                activeColorPrimary: Theme.of(context).primaryColor,
                inactiveColorPrimary: Theme.of(context).primaryColorDark,
                iconSize: 20),
            PersistentBottomNavBarItem(
                icon: const Icon(UniconsLine.user_circle),
                activeColorPrimary: Theme.of(context).primaryColor,
                inactiveColorPrimary: Theme.of(context).primaryColorDark,
                iconSize: 20),
          ],
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: const NavBarDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarHeight: 60,

          popAllScreensOnTapAnyTabs: true,
          navBarStyle: NavBarStyle
              .style6, // Choose the nav bar style with this property.
        ),
      ),
    );
  }
}



