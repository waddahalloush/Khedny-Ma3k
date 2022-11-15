import 'package:flutter/material.dart';

class ChatModalProvider extends ChangeNotifier{
   List<String> chatList = [
    "Hello there. Where is the pickup location in Homs?"
  ];
  
  void addChatToList(String message) {
    chatList.add(message);
    
    notifyListeners();
  }
}