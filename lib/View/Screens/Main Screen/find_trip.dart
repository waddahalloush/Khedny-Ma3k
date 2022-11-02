// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
              height: 43,
            ),
            Container(
              width: context.width,
              height: context.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFD6D6D6)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 26, bottom: 22),
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
                      FindRideFormWidget(
                        color: Theme.of(context).primaryColor,
                        hint: "Location",
                      ),
                      FindRideFormWidget(
                        color: Theme.of(context).primaryColorLight,
                        hint: "Destination",
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  floatingLabelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption,
                                  hintText: "Pick a time",
                                  prefixIcon: const Icon(Icons.timer_outlined),
                                  labelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  floatingLabelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption,
                                  hintText: "Number of people",
                                  prefixIcon: const Icon(Icons.group),
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
                            width: 58,
                            height: 30,
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
