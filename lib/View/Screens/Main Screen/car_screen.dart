// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:khedni_m3k/Core/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
            Text(
              "My Ride",
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                  onPressed: () {},
                  elevation: 2,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.notifications,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
          ],
        ),
        const Divider(),
        const MyRideCardWidget(
          distance: "11,3",
          driver: "Jinny",
          time: "Today, 16:39",
          status: "Ready",
          statusColor: Colors.green,
          from: "Parateek Wisteria Sector 77",
          to: "HCL Technologies Sector 126",
        )
      ],
    );
  }
}

class MyRideCardWidget extends StatelessWidget {
  final String time;
  final String status;
  final Color statusColor;
  final String distance;
  final String from;
  final String to;
  final String driver;
  const MyRideCardWidget({
    Key? key,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.distance,
    required this.from,
    required this.to,
    required this.driver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        width: context.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey.shade300)],
            color: const Color(0xFFFFFFFF)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    time,
                    style: Theme.of(context).primaryTextTheme.overline,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    status,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                        color: statusColor),
                  ),
                  const Spacer(),
                  Image.asset(
                    AssetManager.messageBubble,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    AssetManager.menuH,
                    width: 30,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "$distance \n Km",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                Image.asset(
                  AssetManager.oval,
                  width: 30,
                  height: 70,
                ),
                Column(
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
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorDark,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2))),
                      ),
                      Text(
                        driver,
                        style: Theme.of(context).primaryTextTheme.overline,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      AssetManager.wheel,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white))),
                      Text(
                        driver,
                        style: Theme.of(context).primaryTextTheme.overline,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white))),
                      Text(
                        driver,
                        style: Theme.of(context).primaryTextTheme.overline,
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white))),
                      Text(
                        "+ 1",
                        style: Theme.of(context).primaryTextTheme.subtitle2,
                      )
                    ],
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
