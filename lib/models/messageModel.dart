import 'package:nagisa_talk/models/studentsModel.dart';

class Message{
  List<Student> students;
  String messageText;
  String time;
  String messageUUID;
  Message({required this.students, required this.messageText , required this.time, required this.messageUUID});
}

