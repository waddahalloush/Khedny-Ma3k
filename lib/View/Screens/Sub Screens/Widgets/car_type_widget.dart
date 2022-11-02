// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CarTypeWidget extends StatelessWidget {
  final String carImage;
  final String carName;
  final String carModel;
  final String carColor;
  final int carSeats;
  const CarTypeWidget({
    Key? key,
    required this.carImage,
    required this.carName,
    required this.carModel,
    required this.carColor,
    required this.carSeats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          leading: Image.asset(
            carImage,
          ),
          title: Text(carName,
              style: Theme.of(context).primaryTextTheme.headline1),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(carModel,
                  style: Theme.of(context).primaryTextTheme.bodyText1),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Color : $carColor",
                      style: Theme.of(context).primaryTextTheme.bodyText1),
                  const Spacer(),
                  Text("$carSeats Seats",
                      style: Theme.of(context).primaryTextTheme.bodyText1),
                ],
              )
            ],
          ),
        ));
  }
}
