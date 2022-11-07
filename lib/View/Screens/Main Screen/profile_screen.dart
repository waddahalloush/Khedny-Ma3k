// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:khedni_m3k/Core/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';

import 'Widgets/car_widget.dart';
import 'Widgets/main_app_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MainAppBarWidget(title: " My Profile "),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: context.width,
                    height: 120,
                  ),
                  Container(
                    width: 95,
                    height: 95,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  Positioned(
                      right: 30,
                      bottom: 10,
                      child: Image.asset(
                        AssetManager.edit,
                        width: 30,
                        height: 30,
                      ))
                ],
              ),
              Text("Kimmy Natasa",
                  style: Theme.of(context).primaryTextTheme.headline1),
              const SizedBox(
                height: 5,
              ),
              Text("Verified Profile",
                  style: Theme.of(context).primaryTextTheme.subtitle2),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(
                      AssetManager.banner,
                      height: 83,
                      width: 400,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Quick Ride Wallet",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "43.64 Points",
                        style: TextStyle(
                            fontSize: 20,
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
                children: const [
                  DriverFeaturesWidget(
                    value: "1,260",
                    title: "total ride",
                  ),
                  DriverFeaturesWidget(
                    value: "414",
                    title: "as rider",
                  ),
                  DriverFeaturesWidget(
                    value: "846",
                    title: "as passenger",
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
                          size: 35,
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
                      itemSize: 40.0,
                      direction: Axis.horizontal,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: context.height * 0.22,
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
                        size: 70,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 15,
              fontFamily: "Nunito",
              fontWeight: FontWeight.normal,
              color: Colors.black87),
        ),
      ],
    );
  }
}
