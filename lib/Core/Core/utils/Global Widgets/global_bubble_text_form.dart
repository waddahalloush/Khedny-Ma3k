// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';

class GlobalBubbleTextForm extends StatelessWidget {
  final Widget suffix;
  final String hint;
  const GlobalBubbleTextForm({
    Key? key,
    required this.suffix,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        width: context.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey.shade300)],
            color: const Color(0xFFFFFFFF)),
        child: TextFormField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              suffixIcon: suffix,
              hintText: hint,
              border: InputBorder.none),
        ));
  }
}
