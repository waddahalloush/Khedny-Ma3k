// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../Core/constants/asset_manager.dart';
import '../../../../View Model/app_provider.dart';

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
          InkWell(
            onTap: () => context.read<AppProvider>().openDrawer(),
            child: Card(
                shape: const CircleBorder(),
                elevation: 2,
                shadowColor: Colors.white,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AssetManager.menu,
                    height: 35.h,
                    width: 30.w,
                  ),
                )),
          ),
          const Spacer(),
          Text(
            title,
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Card(
                elevation: 2,
                shape: const CircleBorder(),
                shadowColor: Colors.white,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AssetManager.bell,
                    height: 35.h,
                    width: 30.w,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
