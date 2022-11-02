import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';

import '../../../../Core/Core/constants/asset_manager.dart';
import '../../Sub Screens/Widgets/driver_profile_listtile.dart';
import '../../Sub Screens/Widgets/driver_road_parameter_widget.dart';
import 'find_ride_form_widget.dart';

void showDriverInfoBottomSheet(BuildContext context) => showModalBottomSheet(
      barrierColor: Colors.black45,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      constraints: BoxConstraints(maxHeight: context.height - 80),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: context.width,
        height: context.height,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
        child: const DriverInfoWidget(),
      ),
    );

class DriverInfoWidget extends StatelessWidget {
  const DriverInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.remove,
                  color: Colors.grey,
                  size: 30,
                )),
          ),
          const DriverProfileListTile(
            driverName: "Bernard",
            driverRate: "4.8",
            driverTrips: "298",
          ),
          FindRideFormWidget(
              color: Theme.of(context).primaryColor,
              hint: "1023 Rice Brook Park, New ...."),
          FindRideFormWidget(
              color: Theme.of(context).primaryColorLight,
              hint: "143 Rogers Kittery, New ...."),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: const [
                DriverRoadParameterWidget(
                  icon: AssetManager.clock,
                  title: "16:28",
                  weight: FontWeight.bold,
                ),
                Spacer(),
                DriverRoadParameterWidget(
                  icon: AssetManager.walk,
                  title: "8 Left",
                  weight: FontWeight.bold,
                ),
                Spacer(),
                DriverRoadParameterWidget(
                  icon: AssetManager.money,
                  title: "56",
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
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
          Text("Additional Info",
              style: Theme.of(context).primaryTextTheme.bodyText2),
          Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus fringilla aenean id in nisi, vestibulum in aliquet.",
              softWrap: true,
              style: Theme.of(context).primaryTextTheme.caption),
          
          Row(
            children: [
              Column(
                children: [
                  Text("10,0000",
                      style: Theme.of(context).primaryTextTheme.subtitle2),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Current pick",
                      style: Theme.of(context).primaryTextTheme.caption),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFF004E98),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Send Request",
                      style: Theme.of(context).primaryTextTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}





// Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset(
//             AssetManager.carType,
//           ),
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("Sedan - Loyota i123",
//                   style: Theme.of(context).primaryTextTheme.headline1),
//               Text("MH12D1433",
//                   style: Theme.of(context).primaryTextTheme.headline2),
//               Row(mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text("Color : Red",
//                       style: Theme.of(context).primaryTextTheme.headline2),
//                   const Spacer(),
//                   Text("5 Seats",
//                       style: Theme.of(context).primaryTextTheme.headline2),
//                 ],
//               )
//             ],
//           )
//         ],
//       ),