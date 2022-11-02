import 'package:flutter/material.dart';

import '../../../../Core/Core/constants/asset_manager.dart';

class UserAccountDrawerWidget extends StatelessWidget {
  const UserAccountDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      leading: const CircleAvatar(
        radius: 45,
        backgroundColor: Color(0xFFC4C4C4),
      ),
      title: Text(
        "Kimmy Natasa",
        style: Theme.of(context).primaryTextTheme.headline1,
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Verified",
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
          const SizedBox(
            width: 6,
          ),
          Image.asset(
            AssetManager.king,
            width: 27,
            height: 27,
          )
        ],
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
          )),
    );
  }
}
