// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/Core/utils/Global%20Widgets/not_enough_balance_msg.dart';
import 'package:khedni_m3k/Core/utils/Global%20Widgets/shimmer_widget.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View%20Model/my_profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import '../../../../Core/constants/asset_manager.dart';
import '../Widgets/car_widget.dart';
import '../Widgets/main_app_bar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController userNameController;

  @override
  void initState() {
    userNameController = TextEditingController(text: "Kimmy Natasa");

    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<MyProfileProvider>().loadingTest();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

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
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: MainAppBarWidget(title: "MyProfile".tr(context)),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: context.width,
                    height: 90.h,
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      myType.userImage != null
                          ? CircleAvatar(
                              radius: 40.r,
                              backgroundImage: FileImage(
                                myType.userImage!,
                              ),
                            )
                          : Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.grey),
                            ),
                      InkWell(
                        onTap: () => myType.upLoadImage(context),
                        child: ZoomIn(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15.r,
                            child: const Icon(
                              UniconsLine.camera,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      right: 30,
                      bottom: 10,
                      child: InkWell(
                        onTap: () {
                          myType.changeUserNameState();
                        },
                        child: CircleAvatar(
                          backgroundColor: myType.isUserNameEdit
                              ? Colors.greenAccent
                              : const Color.fromARGB(255, 155, 151, 240),
                          radius: 14.r,
                          child: Icon(
                            UniconsLine.edit_alt,
                            size: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                  width: 200.w,
                  height: 40.h,
                  child: myType.isUserNameEdit
                      ? TextField(
                          autofocus: true,
                          enabled: myType.isUserNameEdit,
                          decoration: InputDecoration(
                              border: myType.isUserNameEdit
                                  ? const UnderlineInputBorder()
                                  : InputBorder.none),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).primaryTextTheme.headline1,
                          controller: userNameController,
                        )
                      : Text(
                          userNameController.text,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ))
              // Text("Kimmy Natasa",
              //     style: Theme.of(context).primaryTextTheme.headline1),
              ,
              SizedBox(
                height: 5.h,
              ),
              ConditionalBuilder(
                condition: myType.isLoading,
                fallback: (context) => Text("VerifiedProfile".tr(context),
                    style: Theme.of(context).primaryTextTheme.subtitle2),
                builder: (context) => const ShimmerWidget.rectangular(
                  width: 100,
                  height: 15,
                  radius: 5,
                ),
              ),
              ConditionalBuilder(
                condition: myType.isLoading,
                builder: (context) => ShimmerWidget.rectangular(
                  width: double.infinity,
                  height: 80.h,
                  radius: 12,
                  marginH: 30,
                  marginV: 5,
                ),
                fallback: (context) => InkWell(onTap: () => showNotEnoughBalanceDialog(context),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AssetManager.banner,
                        height: 80.h,
                        fit: BoxFit.contain,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "QuickWallet".tr(context),
                            style: const TextStyle(
                                fontSize: 13,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            "43.64 ${"Points".tr(context)}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
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
                margin: EdgeInsets.symmetric(vertical: 10.h),
                height: context.height * 0.18,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 5.h),
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
                          color: Theme.of(context).scaffoldBackgroundColor),
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
