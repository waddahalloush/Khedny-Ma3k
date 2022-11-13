// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DriverRoadParameterWidget extends StatelessWidget {
  final String icon;
  final String title;

  final FontWeight weight;

  const DriverRoadParameterWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Nunito",
                  fontWeight: weight,
                  color: const Color(0xFF000000)),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset(
              icon,
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ],
    );
  }
}
