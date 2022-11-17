import 'package:flutter/material.dart';

class AddTripProvider extends ChangeNotifier {
  List<String> priceType = ["PricePassenger", "TotalPrice"];
  String selectedPriceType = "PricePassenger";
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

  void setPriceType(String value) {
    selectedPriceType = value;
    notifyListeners();
  }

  void changeCondition(bool val) {
    isCondition = val;
    notifyListeners();
  }
}
