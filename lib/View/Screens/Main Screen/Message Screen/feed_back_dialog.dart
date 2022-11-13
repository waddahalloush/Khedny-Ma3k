import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:khedni_m3k/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:provider/provider.dart';

import '../../../../View Model/app_provider.dart';

Future<bool> showFeedBackDriverDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => Consumer<AppProvider>(
            builder: (context, myType, child) {
              return Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: _buildDialogContent(context),
              );
            },
          ));
  return Future.value(true);
}

Widget _buildDialogContent(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(
        color: Colors.transparent,
        width: context.width,
        height: context.height / 1.45,
      ),
      Container(
        // Bottom rectangular box
        // to push the box half way below circle
        width: context.width, alignment: Alignment.center,
        height: context.height / 1.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(0),
              elevation: 3,
              child: Column(
                children: [
                  Text(
                    "Somar Bilal",
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Latakia , Tartous , Homs ,  Damascus ",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetManager.tripProgress,
                          height: 40,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Latakia",
                              textAlign: TextAlign.left,
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Damascus",
                              textAlign: TextAlign.left,
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "ratePassenger".tr(context),
                style: Theme.of(context).primaryTextTheme.bodyText2,
              ),
            ),
            RatingBar.builder(
              glow: true,
              glowRadius: 4,
              glowColor: Colors.orange,
              onRatingUpdate: (value) {},
              itemBuilder: (context, index) => const Icon(
                CupertinoIcons.star_fill,
                color: Colors.amber,
              ),
            )
          ],
        ), // spacing inside the box
      ),
      const Positioned(
        top: 0,
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            // Top Circle with icon
            maxRadius: 30.0,
            backgroundColor: Colors.grey,
          ),
        ),
      ),
      Positioned(
          bottom: -25,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: context.width / 1.5,
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5,
                            color: Color.fromARGB(255, 144, 135, 244),
                            offset: Offset(0, 1))
                      ],
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                          colors: [Color(0xFF4C78A3), Color(0xFF004E98)])),
                  child: Text(
                    "Submit".tr(context),
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )),
    ],
  );
}
