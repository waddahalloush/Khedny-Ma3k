import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/constants/asset_manager.dart';
import 'package:khedni_m3k/Model/message_model.dart';

class MessageProvider extends ChangeNotifier {
  List<MessageModel> messages = [];
  bool isLoading = false;
  fillMessageList() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 5), () {});
    messages = [
      MessageModel(userName: "Kimmy Natasha", status: true, imageUrl: AssetManager.c1),
      MessageModel(userName: "Alex Suprun", status: false, imageUrl: AssetManager.c2),
      MessageModel(userName: "Naya Kolvic", status: false, imageUrl:AssetManager.c3 ),
      MessageModel(userName: "Michel Jets", status: true, imageUrl:AssetManager.c4),
      MessageModel(userName: "Noir Ozil", status: true, imageUrl:AssetManager.c5),
    ];
    isLoading = false;
    notifyListeners();
  }
}
