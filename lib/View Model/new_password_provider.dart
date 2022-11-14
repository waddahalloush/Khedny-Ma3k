import 'package:flutter/material.dart';

class NewPasswordProvider extends ChangeNotifier{
   bool isVisible1 = false;
  bool isVisible2 = false;
   void changeVisible1() {
    isVisible1 = !isVisible1;
    notifyListeners();
  }

  void changeVisible2() {
    isVisible2 = !isVisible2;
    notifyListeners();
  }
  void setNewPassword(String newPass, String confirmedPass){
    
  }
}