import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileProvider extends ChangeNotifier {
  bool isUserNameEdit = false;
  File? userImage;
  void changeUserNameState() {
    isUserNameEdit = !isUserNameEdit;
    notifyListeners();
  }

  Future upLoadImage(BuildContext context) async {
    try {
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      userImage = File(pickedImage.path);
      notifyListeners();
    } on PlatformException {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed To Pick Image")));
    }
  }
}
