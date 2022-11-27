import 'package:flutter/material.dart';

class MyTripsProvider extends ChangeNotifier{
   bool isLoading= false;
   loadingTest() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 5), () {});
  
    isLoading = false;
    notifyListeners();
  }
}