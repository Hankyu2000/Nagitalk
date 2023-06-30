import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nagisa_talk/addStudentPage.dart';
import 'package:nagisa_talk/models/studentsModel.dart';
import 'package:nagisa_talk/widgets/studentsList.dart';


import 'package:uuid/uuid.dart';class StudentsListPage extends StatefulWidget{
  @override
  _StudentsListPageState createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage>{
  var uuidFunc = Uuid();
  late List<Student> students = [
    Student(name:"桐藤 ナギサ", schoolName: "トリニティ総合学園", imageUrl: "assets/images/Nagisa.jpeg", uuid: uuidFunc.v4()),
    Student(name:"聖園 ミカ", schoolName: "トリニティ総合学園", imageUrl: "assets/images/Nagisa.jpeg", uuid: uuidFunc.v4()),
    Student(name:"百合園 セイア", schoolName: "トリニティ総合学園", imageUrl: "assets/images/Nagisa.jpeg", uuid: uuidFunc.v4()),
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
                  studentData: students[index],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context){
              return AddStudentPage();
            })
          );
        },

      ),
    );
  }
}