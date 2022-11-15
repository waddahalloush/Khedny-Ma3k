// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View%20Model/my_profile_provider.dart';
import 'package:provider/provider.dart';
import '../../../../Core/constants/asset_manager.dart';
import '../Widgets/car_widget.dart';
import '../Widgets/main_app_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<MyProfileProvider>(
      builder: (context, myType, child) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MainAppBarWidget(title: "MyProfile".tr(context)),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: context.width,
                    height: 90,
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  Positioned(
                      right: 30,
                      bottom: 10,
                      child: Image.asset(
                        AssetManager.edit,
                        width: 20,
                        height: 20,
                      ))
                ],
              ),
              Text("Kimmy Natasa",
                  style: Theme.of(context).primaryTextTheme.headline1),
              const SizedBox(
                height: 5,
              ),
              Text("VerifiedProfile".tr(context),
                  style: Theme.of(context).primaryTextTheme.subtitle2),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      AssetManager.banner,
                      height: 70,
                      width: 400,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "QuickWallet".tr(context),
                        style: const TextStyle(
                            fontSize: 13,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text(
                        "43.64 ${"Points".tr(context)}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DriverFeaturesWidget(
                    value: "1,260",
                    title: "totalride".tr(context),
                  ),
                  DriverFeaturesWidget(
                    value: "414",
                    title: "AsRider".tr(context),
                  ),
                  DriverFeaturesWidget(
                    value: "846",
                    title: "AsPassenger".tr(context),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0XFFFFB461),
                          size: 25,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "4.0",
                              style:
                                  Theme.of(context).primaryTextTheme.headline1,
                            ),
                            Text(
                              "(298)",
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    RatingBarIndicator(
                      rating: 4.0,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Color(0XFFFFB461),
                      ),
                      itemCount: 5,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: context.height * 0.16,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  scrollDirection: Axis.horizontal,
                  children: [
                    const CarWidget(
                      carImage: AssetManager.sedan,
                      carname: "Loyota i12",
                      carmodel: "MH12D1433",
                    ),
                    const CarWidget(
                      carImage: AssetManager.hatch,
                      carname: "Blue Swift",
                      carmodel: "MH12D1433",
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6, color: Colors.grey.shade300)
                          ],
                          color: const Color(0xFFFFFFFF)),
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 50,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}

class DriverFeaturesWidget extends StatelessWidget {
  final String value;
  final String title;
  const DriverFeaturesWidget({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          title,
          style: Theme.of(context).primaryTextTheme.subtitle1,
        ),
      ],
    );
  }
}
