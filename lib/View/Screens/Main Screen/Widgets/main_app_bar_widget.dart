// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:khedni_m3k/View%20Model/app_provider.dart';

import '../../../../Core/constants/asset_manager.dart';

class MainAppBarWidget extends StatelessWidget {
  final String title;
  const MainAppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          FloatingActionButton(
              mini: true,
              heroTag: "m",
              onPressed: () {
                context.read<AppProvider>().openDrawer();
              },
              elevation: 2,
              backgroundColor: Colors.white,
              child: Image.asset(
                AssetManager.menu,
                height: 25,
                width: 20,
              )),
          const Spacer(),
          Text(
            title,
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
          const Spacer(),
          FloatingActionButton(
              mini: true,
              heroTag: "n",
              onPressed: () {},
              elevation: 2,
              backgroundColor: Colors.white,
              child: Image.asset(
                AssetManager.bell,
                height: 25,
                width: 20,
              )),
        ],
      ),
    );
  }
}
