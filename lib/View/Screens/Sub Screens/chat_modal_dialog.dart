import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:khedni_m3k/Controller/app_provider.dart';
import 'package:provider/provider.dart';
import '../../../Core/constants/asset_manager.dart';
import '../Main Screen/Widgets/driver_connection_image.dart';

Future<bool> showChatDriverDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => Consumer<AppProvider>(
            builder: (context, myType, child) {
              return AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                actionsPadding: const EdgeInsets.all(10),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(32.0))),
                title: ListTile(
                  horizontalTitleGap: 1,
                  visualDensity: VisualDensity.compact,
                  dense: true,
                  onTap: () {},
                  leading: Transform.translate(
                      offset: const Offset(-15, 0),
                      child: const DriverConnectionImage()),
                  title: const Text(
                    "Kimmy Natasa",
                    style: TextStyle(
                        fontSize: 15,
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
                        size: 15,
                      )),
                ),
                content: ListView.builder(
                  itemCount: myType.chatList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) => ChatBubble(
                    clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 20),
                    backGroundColor: Colors.blue,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.4,
                      ),
                      child: Text(
                        myType.chatList[i],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                actions: [
                  AppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    title: TextFormField(
                        controller: myType.chatController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Message")),
                    actions: [
                      InkWell(
                        onTap: () {
                          myType.chatController.text.isEmpty
                              ? null
                              : myType
                                  .addChatToList(myType.chatController.text);
                        },
                        child: Image.asset(
                          AssetManager.send,
                          width: 30,
                          height: 30,
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ));
  return Future.value(true);
}
