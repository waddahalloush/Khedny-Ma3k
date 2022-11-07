// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DrawerListTileWidget extends StatelessWidget {
  final String icon;
  final VoidCallback ontap;
  final String title;

  const DrawerListTileWidget({
    Key? key,
    required this.icon,
    required this.ontap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        onTap: ontap,
        leading: Image.asset(
          icon,
          height: 35,
          width: 30,
        ),
        title: Text(
          title,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
      ),
    );
  }
}
