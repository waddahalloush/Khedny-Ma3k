import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/Widgets/driver_connection_image.dart';

class ChatDriver extends StatelessWidget {
  const ChatDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
          margin: const EdgeInsets.all(20),
          width: context.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(blurRadius: 6, color: Colors.grey.shade300)
              ],
              color: const Color(0xFFFFFFFF)),
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                suffixIcon:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                border: InputBorder.none),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                    )),
                const SizedBox(
                  width: 10,
                ),
                const DriverConnectionImage(),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rog Ket Noise Right",
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                    Text(
                      "Online",
                      style: Theme.of(context).primaryTextTheme.caption,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              reverse: true,
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(167, 248, 248, 248),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: const Text(
                    "Np, see yah at pick up point \n in 10 minutes",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Nunito",
                    ),
                    softWrap: true,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color(0xFF43729F),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25))),
                  child: const Text(
                    "Hello there. I’m in hurry.\n Would you mind start our ride now?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: "Nunito",
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
