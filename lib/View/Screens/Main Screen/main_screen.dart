import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/car_screen.dart';
import 'package:khedni_m3k/View/Screens/Sub%20Screens/search_result_screen.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/find_trip.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/message_screen.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:unicons/unicons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    List<Widget> screens = [
      const FindTripScreen(),
      const CarScreen(),
      const SearchResultScreen(),
      const MessageScreen(),
      const ProfileScreen(),
    ];
    return PersistentTabView(
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
            iconSize: 32),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.time_to_leave_outlined),
            activeColorPrimary: Theme.of(context).primaryColor,
            inactiveColorPrimary: Theme.of(context).primaryColorDark,
            iconSize: 32),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            AssetManager.fab,
            width: 100,
            height: 100,
          ),
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(UniconsLine.comment),
            activeColorPrimary: Theme.of(context).primaryColor,
            inactiveColorPrimary: Theme.of(context).primaryColorDark,
            iconSize: 32),
        PersistentBottomNavBarItem(
            icon: const Icon(UniconsLine.user_circle),
            activeColorPrimary: Theme.of(context).primaryColor,
            inactiveColorPrimary: Theme.of(context).primaryColorDark,
            iconSize: 32),
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
      bottomScreenMargin: 85, navBarHeight: 100,

      popAllScreensOnTapAnyTabs: true,
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}



// SafeArea(
//       child: Consumer<AppProvider>(
//         builder: (context, value, child) => Scaffold(
//           key: value.scaffoldKey,
//           drawer: const MainDrawerWidget(),
//           bottomNavigationBar: AnimatedBottomNavigationBar(
//             blurEffect: true, activeColor: Theme.of(context).primaryColor,
//             iconSize: 30, inactiveColor: Theme.of(context).primaryColorDark,
//             leftCornerRadius: 12,
//             rightCornerRadius: 12,
//             elevation: 5,
//             shadow: const BoxShadow(color: Colors.grey, blurRadius: 2),
//             icons: const [
//               UniconsLine.estate,
//               Icons.time_to_leave_outlined,
//               UniconsLine.comment,
//               UniconsLine.user_circle
//             ],
//             activeIndex: context.watch<AppProvider>().navIndex,
//             gapLocation: GapLocation.center,
//             notchSmoothness: NotchSmoothness.sharpEdge,
//             onTap: (index) {
//               context.read<AppProvider>().changeNav(index);
//             },
//             //other params
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               context.read<AppProvider>().changeNav(4);
//             },
//             backgroundColor: Colors.transparent,
//             child: Image.asset(AssetManager.fab),
//           ),
//           body: screens[value.navIndex],
//         ),
//       ),
//     );