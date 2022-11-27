// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/Core/utils/Global%20Widgets/shimmer_widget.dart';

import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View%20Model/my_trips_provider.dart';
import 'package:provider/provider.dart';

import '../../../../Core/constants/asset_manager.dart';
import '../Widgets/driver_road_parameter_widget.dart';

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({Key? key}) : super(key: key);

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
  @override
  void didChangeDependencies() {
    context.read<MyTripsProvider>().loadingTest();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<MyTripsProvider>(
      builder: (context, tripProv, child) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "MYTrips".tr(context),
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Card(
                          shadowColor: Colors.white,
                          shape: const CircleBorder(),
                          elevation: 2,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              AssetManager.bell,
                              height: 35,
                              width: 30,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ConditionalBuilder(
                    condition: tripProv.isLoading,
                    builder: (context) => ShimmerWidget.rectangular(
                      width: double.infinity,
                      height: 250.h,
                      marginH: 20,
                      marginV: 10,
                      radius: 25,
                    ),
                    fallback: (context) => FadeInLeft(
                      delay: Duration(milliseconds: index * 1000),
                      child: MyRideCardWidget(
                        numPassenger: 1,
                        distance: "11,3",
                        time: "20th May, 17:00",
                        status: "waitConfirm".tr(context),
                        from: "Latakia",
                        to: "Damascus",
                      ),
                    ),
                  ),
                ),
              )

              // MyRideCardWidget(
              //   numPassenger: 3,
              //   distance: "11,3",
              //   time: "21th June, 18:00",
              //   status: "Confirmed".tr(context),
              //   from: "Baniyas",
              //   to: "Damascus",
              // )
            ],
          ),
        );
      },
    ));
  }
}

class MyRideCardWidget extends StatelessWidget {
  final String time;
  final String status;
  final int numPassenger;

  final String distance;
  final String from;
  final String to;

  const MyRideCardWidget({
    Key? key,
    required this.time,
    required this.status,
    required this.numPassenger,
    required this.distance,
    required this.from,
    required this.to,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey.shade300)],
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                time,
                style: Theme.of(context).primaryTextTheme.overline,
              ),
              const Spacer(),
              Flash(
                duration: const Duration(milliseconds: 2000),
                child: Image.asset(
                  AssetManager.messageBubble,
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Image.asset(
                AssetManager.hMenu,
                width: 30,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "$distance \n Km",
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              Image.asset(
                AssetManager.tripProgress,
                width: 30,
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      from,
                      style: Theme.of(context).primaryTextTheme.overline,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      to,
                      style: Theme.of(context).primaryTextTheme.overline,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  status,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                      color: status == "Confirmed".tr(context)
                          ? Colors.green
                          : const Color(0xFFFC6752)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Passengers".tr(context),
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
                const Spacer(),
                DriverRoadParameterWidget(
                  icon: numPassenger < 3
                      ? AssetManager.redDot
                      : AssetManager.greenDot,
                  title: "$numPassenger / 3",
                  weight: FontWeight.normal,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
