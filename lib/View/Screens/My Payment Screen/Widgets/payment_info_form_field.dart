import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentInfoFormField extends StatelessWidget {
  final String label;


  final bool isReadOnly;

  final TextEditingController controller;
  const PaymentInfoFormField({
    Key? key,
    required this.label,
   
    required this.isReadOnly,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextFormField(
        controller: controller,
        
        style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.red),
        readOnly: isReadOnly,
        decoration: InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.all(8),
            labelText: label,
            labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: const Color(0XFF004E98))),
      ),
    );
  }
}
