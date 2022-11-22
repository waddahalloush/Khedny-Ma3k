// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          FloatingActionButton(
              heroTag: "m",
              mini: true,
              onPressed: () {
                context.read<AppProvider>().openDrawer();
              },
              elevation: 2,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: ElasticIn(
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  AssetManager.menu,
                  height: 35.h,
                  width: 30.w,
                ),
              )),
          const Spacer(),
          Text(
            title,
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
          const Spacer(),
          FloatingActionButton(
              heroTag: "n",
              mini: true,
              onPressed: () {},
              elevation: 2,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: ElasticIn(
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  AssetManager.bell,
                  height: 35.h,
                  width: 30.w,
                ),
              )),
        ],
      ),
    );
  }
}
