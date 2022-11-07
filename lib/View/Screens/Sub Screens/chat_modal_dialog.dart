import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:khedni_m3k/Core/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';

import '../Main Screen/Widgets/driver_connection_image.dart';

Future<bool> showChatDriverDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: const EdgeInsets.all(10),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(32.0))),
            title: ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              onTap: () {},
              leading: const DriverConnectionImage(),
              title: const Text(
                "Kimmy Natasa",
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000)),
              ),
              subtitle: Text(
                "Online",
                style: Theme.of(context).primaryTextTheme.caption,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 20,
                  )),
            ),
            content: Expanded(
              child: SizedBox(
                width: context.width,
                height: context.height / 3,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ChatBubble(
                      clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.only(top: 20),
                      backGroundColor: Colors.blue,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.4,
                        ),
                        child: const Text(
                          "Hello there. Where is the pickup location in Homs?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ChatBubble(
                      clipper:
                          ChatBubbleClipper5(type: BubbleType.receiverBubble),
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(top: 20),
                      backGroundColor: Colors.grey,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.4,
                        ),
                        child: const Text(
                          "Hello . I'm Ready",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                title: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Enter Message")),
                actions: [
                  Image.asset(
                    AssetManager.send,
                    width: 30,
                    height: 30,
                  )
                ],
              )
            ],
          ));
  return Future.value(true);
}
