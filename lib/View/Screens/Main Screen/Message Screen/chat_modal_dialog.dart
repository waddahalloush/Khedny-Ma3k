import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View%20Model/chat_modal_provider.dart';
import 'package:provider/provider.dart';

import '../Widgets/driver_connection_image.dart';

Future<bool> showChatDriverDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.white)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: const ChatViewWidget(),
    ),
  );
}

class ChatViewWidget extends StatefulWidget {
  const ChatViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatViewWidget> createState() => _ChatViewWidgetState();
}

class _ChatViewWidgetState extends State<ChatViewWidget> {
  late TextEditingController messageController;
  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatModalProvider>(
      builder: (context, myType, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                visualDensity: VisualDensity.compact,
                dense: true,
                onTap: () {},
                leading: const DriverConnectionImage(),
                title: Text(
                  "Kimmy Natasa",
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
                subtitle: Text(
                  "Online".tr(context),
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
              ListView.builder(
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
              TextFormField(
                  style: Theme.of(context).primaryTextTheme.headline3,
                  controller: messageController,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: InkWell(
                        onTap: () {
                          myType.addChatToList(messageController.text);
                          messageController.clear();
                        },
                        child: Icon(
                          Icons.telegram_rounded,
                          size: 30,
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                      hintStyle: Theme.of(context).primaryTextTheme.headline3,
                      hintText: "EnterMessage".tr(context))),
            ],
          ),
        );
      },
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
// import 'package:khedni_m3k/View%20Model/app_provider.dart';
// import 'package:provider/provider.dart';
// import '../Widgets/driver_connection_image.dart';

// Future<bool> showChatDriverDialog(BuildContext context) async {
//   return await showDialog(
//       context: context,
//       builder: (context) => Consumer<AppProvider>(
//             builder: (context, myType, child) {
//               return AlertDialog(
//                 actionsAlignment: MainAxisAlignment.center,
//                 actionsPadding: const EdgeInsets.all(10),
//                 titlePadding: const EdgeInsets.all(0),
//                 backgroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                     side: BorderSide(color: Theme.of(context).primaryColor),
//                     borderRadius:
//                         const BorderRadius.all(Radius.circular(32.0))),
//                 title: ListTile(
//                   visualDensity: VisualDensity.compact,
//                   dense: true,
//                   onTap: () {},
//                   leading: const DriverConnectionImage(),
//                   title: const Text(
//                     "Kimmy Natasa",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontFamily: "Nunito",
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF000000)),
//                   ),
//                   subtitle: Text(
//                     "Online".tr(context),
//                     style: Theme.of(context).primaryTextTheme.caption,
//                   ),
//                   trailing: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.close,
//                         color: Colors.black,
//                         size: 15,
//                       )),
//                 ),
//                 content: Container(
//                   height: 20,
//                 ),
//                 actions: [
//                   TextFormField(
//                       autofocus: true,
//                       controller: myType.chatController,
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           suffix: IconButton(
//                             alignment: Alignment.bottomRight,
//                             padding: const EdgeInsets.all(0),
//                             iconSize: 30,
//                             icon: Icon(
//                               Icons.telegram_rounded,
//                               color: Theme.of(context).canvasColor,
//                             ),
//                             onPressed: () {
//                               myType.addChatToList(myType.chatController.text);
//                             },
//                           ),
//                           hintText: "EnterMessage".tr(context))),
//                 ],
//               );
//             },
//           ));
// }
