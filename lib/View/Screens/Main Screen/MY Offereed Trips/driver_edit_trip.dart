// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/driver_profile_listtile.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/driver_road_parameter_widget.dart';
import '../../../../Core/constants/asset_manager.dart';
import '../../../../Core/utils/Global Widgets/blur_button.dart';
import '../Widgets/car_type_widget.dart';

class DriverEditTripScreen extends StatefulWidget {
  const DriverEditTripScreen({Key? key}) : super(key: key);

  @override
  State<DriverEditTripScreen> createState() => _DriverEditTripScreenState();
}

class _DriverEditTripScreenState extends State<DriverEditTripScreen> {
  late TextEditingController noteController;
  @override
  void initState() {
    noteController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView(shrinkWrap: true, children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
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
                    width: 15,
                    height: 120,
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
                        height: 5,
                      ),
                      Text(
                        "Homs",
                        style: Theme.of(context).primaryTextTheme.headline3,
                      ),
                      const SizedBox(
                        height: 5,
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
                  Text("PricePassenger".tr(context),
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
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset(
                      AssetManager.door,
                      width: 40,
                      height: 40,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Door".tr(context),
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                    trailing: Icon(
                      Icons.check,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Divider(),
                  ),
                  ListTile(
                    leading: Image.asset(
                      AssetManager.smoke,
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      "Smook".tr(context),
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                    trailing: Icon(
                      Icons.check,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Divider(),
                  ),
                  ListTile(
                    leading: Image.asset(
                      AssetManager.air,
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      "Aircondation".tr(context),
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
                  Text("Additional".tr(context),
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
                  Text("Safety".tr(context),
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
                  color: Theme.of(context).scaffoldBackgroundColor),
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
                      Text(
                        "2",
                        style: Theme.of(context).primaryTextTheme.caption,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: noteController,
                      maxLines: 3,
                      readOnly: true,
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
                              border:
                                  Border.all(color: const Color(0xFFFC6752)),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "Decline".tr(context),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFC6752)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: BlurButton(
                                onPress: () {}, label: "Accept".tr(context)))
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
