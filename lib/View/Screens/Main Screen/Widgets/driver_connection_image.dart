// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DriverConnectionImage extends StatelessWidget {
  final Widget leading;
  final bool status;
  const DriverConnectionImage({
    Key? key,
    required this.leading,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        leading,
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              color:status? Colors.greenAccent:Colors.grey,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white)),
        )
      ],
    );
  }
}
