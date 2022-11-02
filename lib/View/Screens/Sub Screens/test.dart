import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/find_trip.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/message_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: controller,
      screens: const [MessageScreen(), FindTripScreen()],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.chat_bubble_text_fill),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person_alt_circle),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
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
          boxShadow: [BoxShadow(blurRadius: 5)]),
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
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      popAllScreensOnTapAnyTabs: true,
      navBarStyle:
          NavBarStyle.style2, // Choose the nav bar style with this property.
    );
  }
}
