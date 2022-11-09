// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/main_app_bar_widget.dart';
import 'package:khedni_m3k/View/Screens/Sub%20Screens/driver_trip_details.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../Core/constants/asset_manager.dart';
import 'Widgets/become_driver_modal.dart';
import '../Sub Screens/Widgets/driver_road_parameter_widget.dart';

class MyOfferedTripScreen extends StatelessWidget {
  const MyOfferedTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MainAppBarWidget(title: 'My Offered Trips')),
            DriverTripWidget(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const DriverTripDetailsScreen(),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              distance: "11,3",
              driver: "Jinny",
              time: "20th May, 17:00",
              status: "Waiting for Confirmation",
              statusColor: Theme.of(context).primaryColorLight,
              from: "Latakia",
              to: "Damascus",
            ),
            InkWell(
              onTap: () {
                showBecomeDriverBottomSheet(context);
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 147),
                width: context.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(blurRadius: 6, color: Colors.grey.shade300)
                    ],
                    color: const Color(0xFFFFFFFF)),
                child: Icon(
                  Icons.add_circle_outline,
                  color: Theme.of(context).primaryColorLight,
                  size: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DriverTripWidget extends StatelessWidget {
  final String time;
  final String status;
  final Color statusColor;
  final String distance;
  final String from;
  final String to;
  final String driver;
  final VoidCallback onTap;
  const DriverTripWidget({
    Key? key,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.distance,
    required this.from,
    required this.to,
    required this.driver,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        width: context.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey.shade300)],
            color: const Color(0xFFFFFFFF)),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  time,
                  style: Theme.of(context).primaryTextTheme.overline,
                ),
                const Spacer(),
                Image.asset(
                  AssetManager.messageBubble,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Image.asset(
                  AssetManager.hMenu,
                  width: 30,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "$distance \n Km",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                Image.asset(
                  AssetManager.tripProgress,
                  width: 30,
                  height: 55,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        from,
                        style: Theme.of(context).primaryTextTheme.overline,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        to,
                        style: Theme.of(context).primaryTextTheme.overline,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: const [
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Passengers",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  Spacer(),
                  DriverRoadParameterWidget(
                    icon: AssetManager.redDot,
                    title: "0 / 2",
                    weight: FontWeight.normal,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
