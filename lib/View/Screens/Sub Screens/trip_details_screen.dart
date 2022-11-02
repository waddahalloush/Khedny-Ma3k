// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:khedni_m3k/View/Screens/Sub%20Screens/Widgets/driver_profile_listtile.dart';
import 'package:khedni_m3k/View/Screens/Sub%20Screens/Widgets/driver_road_parameter_widget.dart';

import '../../../Core/Core/constants/asset_manager.dart';
import 'Widgets/car_type_widget.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({Key? key}) : super(key: key);

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
                  "Tue, 07 Apr. -3 Passengers",
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
                const Spacer(),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(thickness: 2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AssetManager.progress2),
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
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
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
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
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
                      AssetManager.condition,
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
                  border: Border.all(color: Colors.black26),
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
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  const Expanded(
                    child: DriverProfileListTile(
                      driverName: "Bernard",
                      driverRate: "4.8",
                      driverTrips: "289",
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
            ),
            const CarTypeWidget(
              carName: "Sedan - Loyota i123",
              carImage: AssetManager.carType,
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
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.all(40),
                width: double.infinity,
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Book the Trip",
                    style: Theme.of(context).primaryTextTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ])),
    );
  }
}
