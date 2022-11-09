// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Sub%20Screens/Widgets/driver_profile_listtile.dart';
import 'package:khedni_m3k/View/Screens/Sub%20Screens/Widgets/driver_road_parameter_widget.dart';

import '../../../Core/Core/constants/asset_manager.dart';
import 'Widgets/car_type_widget.dart';

class DriverTripDetailsScreen extends StatelessWidget {
  const DriverTripDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView(shrinkWrap: true, children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new)),
                Text(
                  "Tuesday, 17th April",
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
                const Spacer(),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(thickness: 2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetManager.progress,
                    width: 30,
                    height: 100,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Husayn al-Bahr, Tartous",
                        style: Theme.of(context).primaryTextTheme.headline3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Homs",
                        style: Theme.of(context).primaryTextTheme.headline3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Damascus",
                        style: Theme.of(context).primaryTextTheme.headline3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Text("Price per Passenger",
                      style: Theme.of(context).primaryTextTheme.headline3),
                  const Spacer(),
                  const DriverRoadParameterWidget(
                      icon: AssetManager.money,
                      title: "20",
                      weight: FontWeight.bold)
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset(
                      AssetManager.door,
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      "Door to Door",
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                    trailing: Icon(
                      Icons.check,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Image.asset(
                      AssetManager.smoke,
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      "Smooking ",
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                    trailing: Icon(
                      Icons.check,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Image.asset(
                      AssetManager.air,
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      "Air condation",
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                    trailing: Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Additional Info",
                      style: Theme.of(context).primaryTextTheme.bodyText2),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus fringilla aenean id in nisi, vestibulum in aliquet.",
                      softWrap: true,
                      style: Theme.of(context).primaryTextTheme.caption),
                ],
              ),
            ),
            const CarTypeWidget(
              carName: "Sedan - Loyota i123",
              carImage: AssetManager.sedan,
              carModel: "MH12D1433",
              carColor: "Red",
              carSeats: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Safety notice",
                      style: Theme.of(context).primaryTextTheme.bodyText2),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus fringilla aenean id in nisi, vestibulum in aliquet.",
                      softWrap: true,
                      style: Theme.of(context).primaryTextTheme.caption),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      const Expanded(
                        child: DriverProfileListTile(
                            driverName: "Somar",
                            driverRate: "5.0",
                            driverTrips: "325"),
                      ),
                      Image.asset(
                        AssetManager.messageBubble,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        AssetManager.group,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "2",
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      maxLines: 3,
                      initialValue: "I have 2 pieces of luggage ",
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: context.width - 20,
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Theme.of(context).primaryColorLight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "Decline",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorLight),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: BlurButton(onPress: () {}, label: "Accept"))
                      ],
                    ),
                  )
                ],
              ),
            )
          ])),
    );
  }
}
