// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View%20Model/message_provider.dart';

import 'Core/utils/Global Widgets/shimmer_widget.dart';
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
  void didChangeDependencies() {
    context.read<MessageProvider>().fillMessageList();
    super.didChangeDependencies();
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
              Consumer<MessageProvider>(
                builder: (context, prov, child) {
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount:
                            prov.messages.isEmpty ? 5 : prov.messages.length,
                        itemBuilder: (context, index) {
                          return prov.isLoading
                              ? const MessageShimmerWidget()
                              : MessageWidget(
                                  name: prov.messages[index].userName,
                                  status: prov.messages[index].status,
                                  imgUrl: prov.messages[index].imageUrl,
                                );
                        }),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageShimmerWidget extends StatelessWidget {
  const MessageShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      padding: const EdgeInsets.all(5),
      width: context.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey.shade300)],
          color: Theme.of(context).scaffoldBackgroundColor),
      child: ListTile(
        onTap: () {},
        leading: const DriverConnectionImage(
          leading: ShimmerWidget.circular(height: 40, width: 40),
          status: true,
        ),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: ShimmerWidget.rectangular(height: 10, width: 100),
        ),
        subtitle: const Align(
          alignment: Alignment.centerLeft,
          child: ShimmerWidget.rectangular(
            height: 8,
            width: 50,
          ),
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
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      padding: const EdgeInsets.all(5),
      width: context.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey.shade300)],
          color: Theme.of(context).scaffoldBackgroundColor),
      child: ListTile(
        onTap: () {},
        leading: DriverConnectionImage(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
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
          status ? "Online".tr(context) : "Offline",
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
