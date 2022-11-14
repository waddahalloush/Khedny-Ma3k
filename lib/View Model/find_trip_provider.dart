import 'package:flutter/material.dart';

class FindTripProvider extends ChangeNotifier {
  bool doorToDoor = false;
  void changeSwicthDoor(bool val) {
    doorToDoor = val;
    notifyListeners();
  }

  void searchTrip(
      String origin, String distination, String date, String pepoleNum) {}
}
