// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../Widgets/find_driver_widget.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tartous - Damascus",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    Text(
                      "Tue, 07 Apr. -3 Passengers",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Divider(thickness: 2),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return const FindDriverWidget();
              },
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            )
          ],
        ),
      ),
    );
  }
}
