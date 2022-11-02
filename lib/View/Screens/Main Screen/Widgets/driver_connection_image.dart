import 'package:flutter/material.dart';

class DriverConnectionImage extends StatelessWidget {
  const DriverConnectionImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).primaryColorDark,
          radius: 20,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white)),
        )
      ],
    );
  }
}
