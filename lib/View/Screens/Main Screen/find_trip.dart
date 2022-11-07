// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:khedni_m3k/Core/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';

import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Sub%20Screens/search_result_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'Widgets/find_ride_form_widget.dart';
import 'Widgets/main_app_bar_widget.dart';

class FindTripScreen extends StatelessWidget {
  const FindTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MainAppBarWidget(title: "Find Trip"),
            const SizedBox(
              height: 22,
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
                padding: const EdgeInsets.only(top: 24, bottom: 12),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  width: context.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(blurRadius: 6, color: Colors.grey.shade300)
                      ],
                      color: const Color(0xFFFFFFFF)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetManager.mediumProgress,
                            width: 20,
                            height: 85,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                FindRideFormWidget(
                                  color: Theme.of(context).primaryColor,
                                  hint: "Location",
                                ),
                                FindRideFormWidget(
                                  color: Theme.of(context).primaryColorLight,
                                  hint: "Destination",
                                ),
                              ],
                            ),
                          ),
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
                              decoration: InputDecoration(
                                  floatingLabelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption,
                                  hintText: "Pick a time",
                                  labelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
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
                              decoration: InputDecoration(
                                  floatingLabelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption,
                                  hintText: "Number of people",
                                  labelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          FlutterSwitch(
                            onToggle: (value) {},
                            activeColor: Theme.of(context).primaryColorLight,
                            value: true,
                            width: 50,
                            height: 28,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Door to Door"),
                          )
                        ],
                      ),
                      const Spacer(),
                      BlurButton(
                          onPress: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const SearchResultScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          label: "Search")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
