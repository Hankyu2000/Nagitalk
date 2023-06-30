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

@DriftDatabase(tables:[Students])
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

  Future<int> insertStudent(StudentsCompanion student){
    return into(students).insert(student);
  }

  Future deleteStudent(String uuid){
    return (delete(students)..where((std) => std.uuid.equals(uuid))).go();
  }


  StudentsDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
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