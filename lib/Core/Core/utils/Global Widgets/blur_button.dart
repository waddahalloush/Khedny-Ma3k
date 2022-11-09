// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';

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
      child: InkWell(
        onTap: onPress,
        child: Container(
          width: context.width - 20,
          alignment: Alignment.center,
          height: 40,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    blurRadius: 12,
                    color: Color.fromARGB(255, 180, 173, 251),
                    offset: Offset(0, 7))
              ],
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                  colors: [Color(0xFF4C78A3), Color(0xFF004E98)])),
          child: Text(
            label,
            style: Theme.of(context).primaryTextTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
