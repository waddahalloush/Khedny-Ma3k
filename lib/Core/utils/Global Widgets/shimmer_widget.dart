import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool isDarkmode;
  final BoxShape shapeBorder;
  const ShimmerWidget.rectangular(
      {super.key,
      this.width = double.infinity,
      this.isDarkmode = false,
      required this.height,
      this.shapeBorder = BoxShape.rectangle});
  const ShimmerWidget.circular(
      {super.key,
      required this.height,
      required this.width,
      this.isDarkmode = false,
      this.shapeBorder = BoxShape.circle});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor:isDarkmode?Colors.white24 :Colors.white60,
        highlightColor: Colors.white,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(color: Colors.grey, shape: shapeBorder),
        ));
  }
}
