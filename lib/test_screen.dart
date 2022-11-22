import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';

import 'View/Screens/Main Screen/Widgets/driver_connection_image.dart';
import 'View/Screens/Main Screen/Widgets/main_app_bar_widget.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  @override
  void initState() {
  

    super.initState();
  }

  @override
  void dispose() {
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: [
              MainAppBarWidget(title: "Messages".tr(context)),
              ListView(
                shrinkWrap: true,
                children: [
                  SlideInLeft(
                    delay: const Duration(milliseconds: 100),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 5),
                      padding: const EdgeInsets.all(5),
                      width: context.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6, color: Colors.grey.shade300)
                          ],
                          color: Theme.of(context).scaffoldBackgroundColor),
                      child: ListTile(
                        onTap: () {},
                        leading: const DriverConnectionImage(),
                        title: Text(
                          "Kimmy Natasa",
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
                        subtitle: Text(
                          "Online".tr(context),
                          style: Theme.of(context).primaryTextTheme.caption,
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              color: Theme.of(context).primaryColor,
                              size: 30,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
