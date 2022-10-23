// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BlurButton extends StatelessWidget {
  final VoidCallback onPress;
  final String label;
  const BlurButton({
    Key? key,
    required this.onPress,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  blurRadius: 20,
                  color: Color.fromARGB(255, 163, 155, 251),
                  offset: Offset(0, 7))
            ],
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
                colors: [Color(0xFF4C78A3), Color(0xFF004E98)])),
        child: TextButton(
          onPressed: onPress,
          child:
              Text(label, style: Theme.of(context).primaryTextTheme.headline5),
        ),
      ),
    );
  }
}