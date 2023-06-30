import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'package:async/async.dart';
import 'package:nagisa_talk/addStudentPage.dart';
import 'package:nagisa_talk/models/studentsModel.dart';
import 'package:nagisa_talk/widgets/studentsList.dart';
import 'package:nagisa_talk/models/dbs/studentsDataBase.dart' as db;
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:nagisa_talk/main.dart';

class StudentsListPage extends StatefulWidget {
  @override
  _StudentsListPageState createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {
  var uuidFunc = Uuid();
  final logger = Logger();

  late List<Student> students = [];

  void fetchStudentData() {
    List<Student> tempList = [];
    studentsDatabase.allStudentEntries.then((retrievedObj) {
      logger.i(retrievedObj);
      for (var element in retrievedObj) {
        Student tempStudent = Student(
            name: "", schoolName: "", imageUrl: "", uuid: "");
        tempStudent.name = element.name;
        tempStudent.schoolName = element.schoolName;
        tempStudent.imageUrl = element.imageUrl;
        tempStudent.uuid = element.uuid;
        tempList.add(tempStudent);
        logger.i(tempList[0].name);
      }
      setState(() {
        students = tempList;
        logger.i(students.length);
      });
    });
  }

  @override
  void initState() {
    logger.i("inited!");
    fetchStudentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      style: TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
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
              itemBuilder: (context, index) {
                return Dismissible(key: Key(students[index].uuid),
                  background: Container(color: Colors.red,),
                  confirmDismiss: (direction) async {
                    showDialog(context: context,
                      builder: (_) =>
                          AlertDialog(
                            title: Text(
                                AppLocalizations.of(context)!.confirmation),
                            content: Text(AppLocalizations.of(context)!
                                .deleteStudentConfirmationContent),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text(
                                      AppLocalizations.of(context)!.yes)),
                              TextButton(onPressed: () =>
                                  Navigator.pop(context, false),
                                  child: Text(AppLocalizations.of(context)!.no))
                            ],
                          ),
                      barrierDismissible: false,
                    ).then((value){
                      if(value){
                        final backupStudent = students[index];
                        setState((){
                          students.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.itemDismissed(backupStudent.name))));
                        studentsDatabase.deleteStudent(backupStudent.uuid);
                        return true;
                      }else{
                        return false;
                      }
                    });
                  },
                  child: StudentsList(
                    studentData: students[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return AddStudentPage();
              })
          ).then((value) {
            fetchStudentData();
          });
        },
      ),
    );
  }
}