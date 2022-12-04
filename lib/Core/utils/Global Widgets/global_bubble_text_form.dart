// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:khedni_m3k/Core/utils/media_query_ex.dart';

class GlobalBubbleTextForm extends StatelessWidget {
  final Widget suffix;
  final String hint;
  final bool isReadOnly;
  final VoidCallback onTap;
  final TextEditingController controller;
  const GlobalBubbleTextForm({
    Key? key,
    required this.suffix,
    required this.hint,
    required this.isReadOnly,
    required this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          width: context.width,
          height: 50.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(blurRadius: 6, color: Colors.grey.shade300)
              ],
              color: Theme.of(context).scaffoldBackgroundColor),
          child: TextFormField(
            controller: controller,
            readOnly: isReadOnly,
            onTap: onTap,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: suffix,
                hintText: hint,
                hintStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                border: InputBorder.none),
          )),
    );
  }
}
