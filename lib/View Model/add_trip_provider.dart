import 'package:flutter/material.dart';

class AddTripProvider extends ChangeNotifier {
  bool isDoorToDoor = false;
  bool isSmoking = false;
  bool isCondition = false;
  void changeDoorToDoor(bool val) {
    isDoorToDoor = val;
    notifyListeners();
  }

  void changeSmoking(bool val) {
    isSmoking = val;
    notifyListeners();
  }

  void changeCondition(bool val) {
    isCondition = val;
    notifyListeners();
  }
}
