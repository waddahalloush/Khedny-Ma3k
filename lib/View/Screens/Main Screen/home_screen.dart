import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
     children: [ Row(
      children: [
        FloatingActionButton(
            onPressed: () {
             
            },
            elevation: 2,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.menu,
              size: 30,
              color: Theme.of(context).primaryColor,
            )),
        const Spacer(),
        Text(
          "Find Ride",
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
        const Spacer(),
        FloatingActionButton(
            onPressed: () {},
            elevation: 2,
            backgroundColor: Colors.white,
            child: Icon(
                  Icons.notifications,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                )),
      ],
    )],
    );
  }
}
