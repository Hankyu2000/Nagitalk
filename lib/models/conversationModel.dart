import 'package:nagisa_talk/models/messageModel.dart';
import 'package:nagisa_talk/models/studentsModel.dart';

class Conversation{
  final String conversationName;
  final List<Student> participatedStudents;
  final List<Message> messages;
  final String conversationUUID;
  Conversation({required this.conversationName, required this.participatedStudents, required this.messages, required this.conversationUUID});
}