import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/View%20Model/app_provider.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/main_drawer_widget.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/My%20Trips/my_trip_screen.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/MY%20Offereed%20Trips/my_offered_trip_screen.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Find%20Trip/find_trip.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Message%20Screen/message_screen.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/My%20Profile/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import '../../../Core/constants/asset_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const FindTripScreen(),
      const MyOfferedTripScreen(),
      const MyTripScreen(),
      const MessageScreen(),
      const ProfileScreen(),
    ];
    return Consumer<AppProvider>(
      builder: (context, provider, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        key: provider.scaffoldKey,
        drawer: const MainDrawerWidget(),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            color: Theme.of(context).primaryColor,
            index: provider.navIndex,
            onTap: (value) {
              pageController.jumpToPage(value);
            },
            items: [
              const Icon(
                UniconsLine.estate,
                color: Colors.white,
              ),
              const Icon(
                Icons.time_to_leave_outlined,
                color: Colors.white,
              ),
              Image.asset(
                AssetManager.fab,
                width: 40.w,
                height: 40.h,
              ),
              const Icon(
                UniconsLine.comment,
                color: Colors.white,
              ),
              const Icon(
                UniconsLine.user_circle,
                color: Colors.white,
              ),
            ]),
        body: PageView.builder(
          
          controller: pageController,
          itemCount: screens.length,
          onPageChanged: (value) => provider.changeNav(value),
          itemBuilder: (context, index) => screens[index],
        ),
      ),
    );
  }
}


// PersistentTabView(
//           onItemSelected: (value) {
//             value == 1
//                 ? showBecomeDriverBottomSheet(context)
//                 : controller.jumpToTab(value);
//           },
//           context,
//           controller: controller,
//           screens: screens,
//           items: [
//             PersistentBottomNavBarItem(
//                 icon: const Icon(
//                   UniconsLine.estate,
//                 ),
//                 activeColorPrimary: Theme.of(context).primaryColor,
//                 inactiveColorPrimary: Theme.of(context).primaryColorDark,
//                 iconSize: 30.sp),
//             PersistentBottomNavBarItem(
//                 icon: const Icon(Icons.time_to_leave_outlined),
//                 activeColorPrimary: Theme.of(context).primaryColor,
//                 inactiveColorPrimary: Theme.of(context).primaryColorDark,
//                 iconSize: 30.sp),
//             PersistentBottomNavBarItem(
//               icon: Image.asset(
//                 AssetManager.fab,
//                 width: 50.w,
//                 height: 50.h,
//               ),
//             ),
//             PersistentBottomNavBarItem(
//                 icon: const Icon(UniconsLine.comment),
//                 activeColorPrimary: Theme.of(context).primaryColor,
//                 inactiveColorPrimary: Theme.of(context).primaryColorDark,
//                 iconSize: 30.sp),
//             PersistentBottomNavBarItem(
//                 icon: const Icon(UniconsLine.user_circle),
//                 activeColorPrimary: Theme.of(context).primaryColor,
//                 inactiveColorPrimary: Theme.of(context).primaryColorDark,
//                 iconSize: 30.sp),
//           ],
//           confineInSafeArea: true,
//           backgroundColor: Theme.of(context)
//               .scaffoldBackgroundColor, // Default is Colors.white.
//           handleAndroidBackButtonPress: true, // Default is true.
//           resizeToAvoidBottomInset:
//               true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//           stateManagement: true, // Default is true.
//           hideNavigationBarWhenKeyboardShows:
//               true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//           decoration: const NavBarDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//               boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
//           popAllScreensOnTapOfSelectedTab: true,
//           popActionScreens: PopActionScreensType.all,
//           itemAnimationProperties: const ItemAnimationProperties(
//             // Navigation Bar's items animation properties.
//             duration: Duration(milliseconds: 200),
//             curve: Curves.ease,
//           ),
//           screenTransitionAnimation: const ScreenTransitionAnimation(
//             // Screen transition animation on change of selected tab.
//             animateTabTransition: true,
//             curve: Curves.ease,
//             duration: Duration(milliseconds: 200),
//           ),
//           navBarHeight: 90.h,

//           popAllScreensOnTapAnyTabs: true,
//           navBarStyle: NavBarStyle
//               .style6, // Choose the nav bar style with this property.
//         ),