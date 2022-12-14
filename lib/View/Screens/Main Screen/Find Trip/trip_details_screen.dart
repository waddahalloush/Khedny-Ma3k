// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/View%20Model/trip_details_provider.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Find%20Trip/request_trip_bottom_sheet.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Message%20Screen/feed_back_dialog.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/driver_profile_listtile.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/driver_road_parameter_widget.dart';
import 'package:provider/provider.dart';
import '../../../../Core/constants/asset_manager.dart';
import '../Widgets/car_type_widget.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<TripDetailsProvider>(
      builder: (context, myType, child) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView(shrinkWrap: true, children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
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
                    border: Border.all(color: Colors.black26),
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
                        width: 30,
                        height: 30,
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
                    const Divider(),
                    ListTile(
                      leading: Image.asset(
                        AssetManager.smoke,
                        width: 30,
                        height: 30,
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
                    const Divider(),
                    ListTile(
                      leading: Image.asset(
                        AssetManager.air,
                        width: 30,
                        height: 30,
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
                    border: Border.all(color: Colors.grey),
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
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
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
                        onPressed: () {
                          showFeedBackDriverDialog(context, "Bernard",
                              ["Latakia", "Tartous", "Homs", "Damascus"]);
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded))
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
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () => showRequestTripBottomSheet(context),
                  child: Container(
                    margin: const EdgeInsets.all(40),
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFC6752),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Book".tr(context),
                      style: Theme.of(context).primaryTextTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ]));
      },
    ));
  }
}
