import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

part 'studentsDatabase.g.dart';

class Students extends Table{
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get imageUrl => text()();
  TextColumn get schoolName => text()();
}

@DriftDatabase(tables:[Students])
class StudentsDatabase extends _$StudentsDatabase {
  StudentsDatabase(): super(_openConnection());
  @override
  int get schemaVersion => 1;

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
}