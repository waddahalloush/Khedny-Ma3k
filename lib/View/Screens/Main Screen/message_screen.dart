import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/main_app_bar_widget.dart';
import 'package:khedni_m3k/View/Screens/Sub%20Screens/chat_modal_dialog.dart';

import 'Widgets/driver_connection_image.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            const MainAppBarWidget(title: " Messages "),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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
                      showChatDriverDialog(context);
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
          ],
        ),
      ),
    );
  }
}
