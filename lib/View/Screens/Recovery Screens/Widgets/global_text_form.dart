// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GlobalTextForm extends StatelessWidget {
  final String label;
  final bool obSecure;
  final Widget suffix;
  final bool isReadOnly;
  final VoidCallback onTap;
  final TextEditingController controller;
 
  final TextInputType keyBoardType;

  const GlobalTextForm({
    Key? key,
    required this.label,
    required this.obSecure,
    required this.suffix,
    required this.isReadOnly,
    required this.onTap,
    required this.controller,
    required this.keyBoardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: controller,
      readOnly: isReadOnly,onTap: onTap,
      decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: Theme.of(context).primaryTextTheme.caption,
          labelText: label,suffixIcon:suffix ,
          labelStyle: Theme.of(context).primaryTextTheme.caption),
     
      keyboardType: keyBoardType,
      obscureText: obSecure,
    );
  }
}
