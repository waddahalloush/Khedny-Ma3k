// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../Core/constants/asset_manager.dart';

class DriverProfileListTile extends StatelessWidget {
  final String driverName;
  final String driverRate;
  final String driverTrips;
  const DriverProfileListTile({
    Key? key,
    required this.driverName,
    required this.driverRate,
    required this.driverTrips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Color(0xFFC4C4C4),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            driverName,
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
          Image.asset(
            AssetManager.purplecrown,
            height: 20,
            width: 20,
          )
        ],
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            driverRate,
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            "($driverTrips)",
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
