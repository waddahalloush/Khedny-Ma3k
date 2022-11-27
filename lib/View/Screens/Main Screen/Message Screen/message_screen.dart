import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/main_app_bar_widget.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Message%20Screen/chat_modal_dialog.dart';
import 'package:provider/provider.dart';

import '../../../../Core/utils/Global Widgets/shimmer_widget.dart';
import '../../../../View Model/message_provider.dart';
import '../Widgets/driver_connection_image.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void didChangeDependencies() {
    context.read<MessageProvider>().fillMessageList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<MessageProvider>(
      builder: (context, prov, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                MainAppBarWidget(title: "Messages".tr(context)),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ConditionalBuilder(
                          condition: prov.isLoading,
                          builder: (context) => const ShimmerWidget.rectangular(
                            width: double.infinity,
                            height: 80,
                            radius: 20,
                            marginH: 5,
                            marginV: 5,
                          ),
                          fallback: (context) => FadeInLeft(
                            delay: Duration(milliseconds: index * 1000),
                            child: MessageWidget(
                              name: prov.messages[index].userName,
                              status: prov.messages[index].status,
                              imgUrl: prov.messages[index].imageUrl,
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}

class MessageWidget extends StatelessWidget {
  final String name;
  final String imgUrl;
  final bool status;
  const MessageWidget({
    Key? key,
    required this.name,
    required this.imgUrl,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      width: context.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey.shade300)],
          color: Theme.of(context).scaffoldBackgroundColor),
      child: ListTile(
        onTap: () {
          showChatDriverDialog(context, name, imgUrl, status);
        },
        leading: DriverConnectionImage(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(
              imgUrl,
            ),
            radius: 20,
          ),
          status: status,
        ),
        title: Text(
          name,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
        subtitle: Text(
          status ? "Online".tr(context) : "Offline".tr(context),
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
    );
  }
}
