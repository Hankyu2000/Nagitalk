import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

part 'studentsDataBase.g.dart';

class Students extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get imageUrl => text()();
  TextColumn get schoolName => text()();
}

class Conversations extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withDefault(const Constant("新しい会話"))();
  TextColumn get uuid => text().unique()();
}

class Messages extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get messageUUID => text().unique()();
  TextColumn get senderUUID => text()();
  TextColumn get conversationUUID => text()();
  TextColumn get content => text()();
}

class Settings extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get key => text()();
  TextColumn get value => text()();
}
@DriftDatabase(tables:[Students, Conversations, Messages])
class StudentsDatabase extends _$StudentsDatabase {
  // void addStudent({required String uuid, required String name, required String imageUrl, required String schoolName}) async{
  //   try{
  //     await studentsDatabase
  //         .into(studentsDatabase.students)
  //         .insert(StudentsCompanion.insert(uuid: uuid, name: name, imageUrl: imageUrl, schoolName: schoolName));
  //   }catch(e){
  //     logger.e(e);
  //   }
  // }
  //
  // void removeStudent async({required String uuid}){
  //   await studentsDatabase.delete(studentsDatabase.students).where((tbl) => tbl.uuid.equals(uuid));
  // }
  Future<List<Student>> get allStudentEntries => select(students).get();
  Future<List<Message>> get allMessages => select(messages).get();
  Future<List<Conversation>> get allConversations => select(conversations).get();
  Future<List<Message>> belongingMessages(String conversationUUID){
    return (select(messages)..where((tbl) => tbl.conversationUUID.equals(conversationUUID))).get();
  }

  Future<Student> getStudent(String studentUUID){
    return (select(students)..where((tbl) => tbl.uuid.equals(studentUUID))).getSingle();
  }
  Future<int> postNewMessage(MessagesCompanion message){
    return into(messages).insert(message);
  }

  Future deleteMessage(String messageUUID){
    return (delete(messages)..where((std) => std.messageUUID.equals(messageUUID))).go();
  }

  Future deleteAllMessageFromStudent(String studentUUID){
    return (delete(messages)..where((std) => std.senderUUID.equals(studentUUID))).go();
  }

  Future deleteAllMessageBelongsToConversation(String conversationUUID){
    return (delete(messages)..where((tbl) => tbl.conversationUUID.equals(conversationUUID))).go();
  }

  Future deleteConversation(String conversationUUID){
    return (delete(conversations)..where((tbl) => tbl.uuid.equals(conversationUUID))).go();
  }



  Future<int> insertStudent(StudentsCompanion student){
    return into(students).insert(student);
  }

  Future deleteStudent(String studentUUID){
    return (delete(students)..where((std) => std.uuid.equals(studentUUID))).go();
  }

  Future<int> insertConversation(ConversationsCompanion conversationsCompanion){
    return into(conversations).insert(conversationsCompanion);
  }




  StudentsDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration{
    return MigrationStrategy(
      onCreate: (Migrator m) async{
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async{
        if(from < 2){
          await m.createTable(conversations);
          await m.createTable(messages);
        }
        if(from < 3){
          await m.addColumn(conversations, conversations.name);
        }
      }
    );
  }
}

LazyDatabase _openConnection(){
  return LazyDatabase(() async {
    var docDir = await getApplicationDocumentsDirectory();
    if(Platform.isMacOS || Platform.isWindows || Platform.isLinux){
      final Directory saveDir = Directory("${docDir.path}/nagitalk/");
      if(!(await saveDir.exists())){
        saveDir.create(recursive: true);
      }
    }else{
      final Directory saveDir = docDir;
    }
    final file = File(p.join(docDir.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}