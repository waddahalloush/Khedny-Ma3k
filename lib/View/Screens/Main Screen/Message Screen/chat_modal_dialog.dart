import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/View%20Model/app_provider.dart';
import 'package:provider/provider.dart';
import '../Widgets/driver_connection_image.dart';

Future<bool> showChatDriverDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => Consumer<AppProvider>(
            builder: (context, myType, child) {
              return AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                actionsPadding: const EdgeInsets.all(10),
                titlePadding: const EdgeInsets.all(0),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(32.0))),
                title: ListTile(
                  visualDensity: VisualDensity.compact,
                  dense: true,
                  onTap: () {},
                  leading: const DriverConnectionImage(),
                  title: const Text(
                    "Kimmy Natasa",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000)),
                  ),
                  subtitle: Text(
                    "Online".tr(context),
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
                  physics: const BouncingScrollPhysics(),
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                actions: [
                  TextFormField(
                      autofocus: true,
                      controller: myType.chatController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffix: IconButton(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.all(0),
                            iconSize: 30,
                            icon: Icon(
                              Icons.telegram_rounded,
                              color: Theme.of(context).canvasColor,
                            ),
                            onPressed: () {
                              myType.addChatToList(myType.chatController.text);
                            },
                          ),
                          hintText: "EnterMessage".tr(context))),
                ],
              );
            },
          ));
  return Future.value(true);
}
