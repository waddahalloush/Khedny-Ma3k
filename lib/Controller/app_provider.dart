import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AppProvider extends ChangeNotifier {
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool doorToDoor = false;
  bool driverLicense = false;
  bool airCondition = false;
  int navIndex = 0;
   File? driverimage;
   File? carimage;
  TextEditingController numOfPepoleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController numSeatsController = TextEditingController();

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

  void changeSwicthDoor(bool val) {
    doorToDoor = val;
    notifyListeners();
  }
  void changeDriverLicense() {
    driverLicense = !driverLicense;
    notifyListeners();
  }
  void changeairCondition(bool val) {
    airCondition = val;
    notifyListeners();
  }

  void setNumOfPepole(int val) {
    numOfPepoleController.text = val.toString();
    notifyListeners();
  }

  void setTime(TimeOfDay val) {
    timeController.text = "${val.hour}:${val.minute}";
    notifyListeners();
  }
  Future upLoadImage(BuildContext context , bool isDriver) async {
    try {
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
     isDriver? driverimage = File(pickedImage.path):carimage = File(pickedImage.path);
      notifyListeners();
    } on PlatformException {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed To Pick Image")));
    }
  }
}
