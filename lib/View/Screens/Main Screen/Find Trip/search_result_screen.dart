// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/Core/utils/Global%20Widgets/shimmer_widget.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View%20Model/search_result_provider.dart';
import 'package:provider/provider.dart';

import '../Widgets/find_driver_widget.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  void didChangeDependencies() {
    context.read<SearchResultProvider>().loadingTest();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<SearchResultProvider>(
      builder: (context, myType, child) {
        return SafeArea(
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tartous - Damascus",
                        style: Theme.of(context).primaryTextTheme.headline3,
                      ),
                      Text(
                        "Tue, 07 Apr. -3 Passengers",
                        style: Theme.of(context).primaryTextTheme.headline3,
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(),
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return ConditionalBuilder(
                      condition: myType.isLoading,
                      builder: (context) => ShimmerWidget.rectangular(
                            width: context.width - 20,
                            height: 200.h,
                            marginH: 20,
                            marginV: 10,
                            radius: 15,
                          ),
                      fallback: (context) => FadeInLeft(
                          delay: Duration(milliseconds: index * 1000),
                          child: const FindDriverWidget()));
                },
                itemCount: 3,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
              )
            ],
          ),
        );
      },
    ));
  }
}
