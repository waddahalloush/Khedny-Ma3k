import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarWidget extends StatelessWidget {
  final String carImage;
  final String carname;
  final String carmodel;

  const CarWidget({
    Key? key,
    required this.carImage,
    required this.carname,
    required this.carmodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 5),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey.shade300)],
          color: Theme.of(context).scaffoldBackgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            carImage,
            width: 70.w,
            height: 60.h,
          ),
          Text(
            carname,
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
          Text(
            carmodel,
            style: Theme.of(context).primaryTextTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
