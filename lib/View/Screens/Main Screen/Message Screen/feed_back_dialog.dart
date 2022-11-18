import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:khedni_m3k/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';

Future<bool> showFeedBackDriverDialog(
    BuildContext context, String driverName, List<String> way) {
  showDialog(
      context: context,
      builder: (context) => Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: _buildDialogContent(context, driverName, way),
          ));
  return Future.value(true);
}

Widget _buildDialogContent(
    BuildContext context, String driverName, List<String> way) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(
        color: Colors.transparent,
        width: context.width,
        height: context.height / 1.65,
      ),
      Container(
        // Bottom rectangular box
        // to push the box half way below circle
        width: context.width, alignment: Alignment.center,
        height: context.height / 1.9,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Card(
              color: Theme.of(context).cardColor,
              margin: const EdgeInsets.all(0),
              elevation: 3,
              child: Column(
                children: [
                  Text(
                    driverName,
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: List.generate(
                        way.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                way[index],
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1,
                              ),
                            )),
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
                          height: 50,
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
                              way.first,
                              textAlign: TextAlign.left,
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              way.last,
                              textAlign: TextAlign.left,
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "ratePassenger".tr(context),
              style: Theme.of(context).primaryTextTheme.bodyText2,
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
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "rateNote".tr(context),
                  hintStyle: Theme.of(context).primaryTextTheme.caption,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
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
