import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/app_router.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/main_app_bar_widget.dart';

import 'Widgets/driver_connection_image.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            const MainAppBarWidget(title: " Messages "),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              padding: const EdgeInsets.all(5),
              width: context.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(blurRadius: 6, color: Colors.grey.shade300)
                  ],
                  color: const Color(0xFFFFFFFF)),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.chatRoute);
                },
                leading: const DriverConnectionImage(),
                title: Text(
                  "Kimmy Natasa",
                  style: Theme.of(context).primaryTextTheme.headline1,
                ),
                subtitle: Text(
                  "Online",
                  style: Theme.of(context).primaryTextTheme.caption,
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.black,
                      size: 20,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
