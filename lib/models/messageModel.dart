import 'package:nagisa_talk/models/studentsModel.dart';

class Message{
  Student sender;
  String messageText;
  //String time;
  //Offline: Currently not in use
  String messageUUID;
  String conversationUUID;
  Message({required this.sender, required this.messageText, required this.messageUUID, required this.conversationUUID});
}

