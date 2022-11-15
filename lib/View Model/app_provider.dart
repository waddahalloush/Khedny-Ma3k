import 'dart:io';

import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool doorToDoor = false;

 
  int navIndex = 0;

  

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void changeNav(int index) {
    navIndex = index;
    notifyListeners();
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();

    notifyListeners();
  }

 
}
