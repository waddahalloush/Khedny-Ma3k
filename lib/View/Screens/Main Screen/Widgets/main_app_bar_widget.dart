// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:khedni_m3k/Controller/app_provider.dart';

class MainAppBarWidget extends StatelessWidget {
  final String title;
  const MainAppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingActionButton(
            onPressed: () {
              context.read<AppProvider>().openDrawer();
            },
            elevation: 2,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.menu,
              size: 30,
              color: Theme.of(context).primaryColor,
            )),
        const Spacer(),
        Text(
          title,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
        const Spacer(),
        FloatingActionButton(
            onPressed: () {},
            elevation: 2,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.notifications,
              size: 30,
              color: Theme.of(context).primaryColor,
            )),
      ],
    );
  }
}
