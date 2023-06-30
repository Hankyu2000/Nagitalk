import 'package:nagisa_talk/models/dbs/studentsDataBase.dart';

final studentsDatabase = StudentsDatabase();

void addStudent({required String uuid, required String name, required String imageUrl, required String schoolName}) async{
  await studentsDatabase.into();
}