// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_maps_webservice/places.dart';

class FindRideFormWidget extends StatelessWidget {
  final Color color;
  final String hint;
  final TextEditingController controller;
  const FindRideFormWidget({
    Key? key,
    required this.color,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 1000),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          style: Theme.of(context).primaryTextTheme.headline3,
          controller: controller,
          readOnly: true,
          onTap: () async {
            final Prediction? p = await PlacesAutocomplete.show(
              insetPadding: const EdgeInsets.all(8),
              context: context,
              apiKey: '',
              overlayBorderRadius: BorderRadius.circular(10),
              radius: 5,

              mode: Mode.overlay, // or Mode.fullscreen
              language: 'ar',
              components: [Component(Component.country, 'sy')],
            );
            controller.text = p!.description ?? "";
          },
          decoration: InputDecoration(
              constraints: const BoxConstraints(maxHeight: 35),
              hintText: hint,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    size: 15,
                    color: Color(0XFF5E5E5E),
                  )),
              hintStyle: Theme.of(context).primaryTextTheme.headline3,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 4, vertical: 10)),
        ),
      ),
    );
  }
}
