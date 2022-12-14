// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:provider/provider.dart';

import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View%20Model/chat_modal_provider.dart';

import '../Widgets/driver_connection_image.dart';

Future<bool> showChatDriverDialog(
    BuildContext context, String username, String imageUrl, bool status) async {
  return await showDialog(
    context: context,
    builder: (context) => Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.white)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ChatViewWidget(
        username: username,
        status: status,
        imageUrl: imageUrl,
      ),
    ),
  );
}

class ChatViewWidget extends StatefulWidget {
  const ChatViewWidget({
    Key? key,
    required this.username,
    required this.imageUrl,
    required this.status,
  }) : super(key: key);
  final String username;
  final String imageUrl;
  final bool status;
  @override
  State<ChatViewWidget> createState() => _ChatViewWidgetState();
}

class _ChatViewWidgetState extends State<ChatViewWidget> {
  late TextEditingController messageController;
  late ScrollController scrollController;
  @override
  void initState() {
    messageController = TextEditingController();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatModalProvider>(
      builder: (context, myType, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                visualDensity: VisualDensity.compact,
                dense: true,
                onTap: () {},
                leading: DriverConnectionImage(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    backgroundImage: NetworkImage(widget.imageUrl),
                    radius: 20,
                  ),
                  status: widget.status,
                ),
                title: Text(
                  widget.username,
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
                subtitle: Text(
                  widget.status ? "Online".tr(context) : "Offline".tr(context),
                  style: Theme.of(context).primaryTextTheme.caption,
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 15,
                    )),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => index % 2 == 0
                      ? ChatBubble(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.all(8),
                          clipper: ChatBubbleClipper5(
                            type: BubbleType.sendBubble,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            constraints:
                                BoxConstraints(maxWidth: context.width / 2),
                            child: Text(
                              myType.chatList[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : ChatBubble(
                          backGroundColor: Colors.grey,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.all(8),
                          clipper: ChatBubbleClipper5(
                            type: BubbleType.receiverBubble,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            constraints:
                                BoxConstraints(maxWidth: context.width / 2),
                            child: Text(
                              myType.chatList[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                  itemCount: myType.chatList.length,
                ),
              ),
              TextFormField(
                  style: Theme.of(context).primaryTextTheme.headline3,
                  controller: messageController,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: InkWell(
                        onTap: () {
                          messageController.text.isEmpty
                              ? null
                              : myType.addChatToList(messageController.text);
                          scrollController.jumpTo(
                              scrollController.position.maxScrollExtent + 70);
                          messageController.clear();
                        },
                        child: Icon(
                          Icons.telegram_rounded,
                          size: 30,
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                      hintStyle: Theme.of(context)
                          .primaryTextTheme
                          .headline3!
                          .copyWith(color: Colors.grey),
                      hintText: "EnterMessage".tr(context))),
            ],
          ),
        );
      },
    );
  }
}
