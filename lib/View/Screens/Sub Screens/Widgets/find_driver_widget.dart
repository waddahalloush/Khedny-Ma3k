import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Sub%20Screens/trip_details_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../Core/Core/constants/asset_manager.dart';
import 'driver_profile_listtile.dart';
import 'driver_road_parameter_widget.dart';

class FindDriverWidget extends StatelessWidget {
  const FindDriverWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const TripDetailsScreen(),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        width: context.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey.shade300)],
            color: const Color(0xFFFFFFFF)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AssetManager.miniProgress,
                  height: 45,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Tartous",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Damascus",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    DriverRoadParameterWidget(
                      icon: AssetManager.money,
                      title: "20",
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    DriverRoadParameterWidget(
                      icon: AssetManager.clock,
                      title: "16:28",
                      weight: FontWeight.normal,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    DriverRoadParameterWidget(
                      icon: AssetManager.redDot,
                      title: "0 / 2",
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
              ],
            ),
            const DriverProfileListTile(
              driverName: "Bernard",
              driverRate: "4.8",
              driverTrips: "289",
            ),
          ],
        ),
      ),
    );
  }
}
