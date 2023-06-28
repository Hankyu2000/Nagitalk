import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nagisa_talk/models/studentsModel.dart';
import 'package:nagisa_talk/widgets/studentsList.dart';


import 'package:uuid/uuid.dart';class StudentsListPage extends StatefulWidget{
  @override
  _StudentsListPageState createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage>{
  var uuidFunc = Uuid();
  late List<Students> students = [
    Students(name:"桐藤 ナギサ", schoolName: "トリニティ総合学園", imageUrl: "assets/images/Nagisa.jpeg", uuid: uuidFunc.v4()),
    Students(name:"聖園 ミカ", schoolName: "トリニティ総合学園", imageUrl: "assets/images/Nagisa.jpeg", uuid: uuidFunc.v4()),
    Students(name:"百合園 セイア", schoolName: "トリニティ総合学園", imageUrl: "assets/images/Nagisa.jpeg", uuid: uuidFunc.v4()),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.hStudents,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemCount: students.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return StudentsList(
                  name: students[index].name,
                  schoolName: students[index].schoolName,
                  imageUrl: students[index].imageUrl,
                  uuid: students[index].uuid,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,

      ),
    );
  }
}