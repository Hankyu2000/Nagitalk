import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:nagisa_talk/models/conversationModel.dart';
import 'package:nagisa_talk/models/dbs/studentsDataBase.dart' as db;
import 'package:nagisa_talk/models/messageModel.dart';
import 'package:nagisa_talk/models/studentsModel.dart';
import 'package:uuid/uuid.dart';

class ChatController{
  final Logger logger = Logger();
  final uuid = Uuid();
  final db.StudentsDatabase database;
  ChatController({required this.database});
  Future<Map<String, Message>> fetchAllMessages() async{
    Map<String, Message> sortedMessages = {};
    List<db.Message> rawMessages = await database.allMessages;
    logger.i(rawMessages);
    return sortedMessages;
  }

  void newConversation(){
    logger.i("Created new conversation!");
    database.insertConversation(db.ConversationsCompanion(uuid: Value(uuid.v4()), name: Value("新しい会話")));
  }

  Future<List<Conversation>> getConversationList() async{
    List<Conversation> conversationsList = [];

    final rawConversations = await database.allConversations;
    for(var conversation in rawConversations){
      List<Student> tempPartStudents = [];
      List<Message> tempMessages = [];
      final rawMessages = await database.belongingMessages(conversation.uuid);
      for(var message in rawMessages){
        db.Student tempStudent = await database.getStudent(message.senderUUID);
        var tempPartStudent = Student(name: tempStudent.name, imageUrl: tempStudent.imageUrl, schoolName: tempStudent.schoolName, uuid: tempStudent.uuid);
        tempMessages.add(Message(sender: tempPartStudent, messageText: message.content, messageUUID: message.messageUUID, conversationUUID: message.conversationUUID));
        tempPartStudents.add(tempPartStudent);
      }
      tempPartStudents.toSet().toList();
      conversationsList.add(Conversation(conversationName: conversation.name, participatedStudents: tempPartStudents, messages: tempMessages, conversationUUID: conversation.uuid));
    }
    return conversationsList;
  }
}