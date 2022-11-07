import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool isVisible1 = false;
  bool isVisible2 = false;
  int navIndex = 0;
  List<String> chatList = [
    "Hello there. Where is the pickup location in Homs?"
  ];
  TextEditingController chatController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void changeVisible1() {
    isVisible1 = !isVisible1;
    notifyListeners();
  }

  void changeVisible2() {
    isVisible2 = !isVisible2;
    notifyListeners();
  }

  void changeNav(int index) {
    navIndex = index;
    notifyListeners();
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();

    notifyListeners();
  }

  void addChatToList(String message) {
    chatList.add(message);
    chatController.clear();
    notifyListeners();
  }
}
