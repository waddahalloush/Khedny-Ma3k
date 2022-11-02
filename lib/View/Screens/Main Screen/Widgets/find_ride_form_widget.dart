import 'package:flutter/material.dart';

class FindRideFormWidget extends StatelessWidget {
  final Color color;
  final String hint;
  const FindRideFormWidget({
    Key? key,
    required this.color,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: color,
            child: const CircleAvatar(
              radius: 5,
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: hint,
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        size: 15,
                        color: Color(0XFF5E5E5E),
                      )),
                  hintStyle: const TextStyle(
                      color: Color(0XFF5E5E5E),
                      fontSize: 18,
                      fontFamily: 'Nunito'),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            ),
          ),
        ],
      ),
    );
  }
}
