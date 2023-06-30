import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nagisa_talk/chatDetailPage.dart';
import 'package:nagisa_talk/models/studentsModel.dart';
import 'dart:io';

class StudentsList extends StatefulWidget{
  final Student studentData;

  StudentsList({required this.studentData});
  @override
  _StudentsListState createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList>{
  late String studentInitial = "";
  final logger = Logger();
  void checkStudentName(){
    if(widget.studentData.name.isNotEmpty){
      if(widget.studentData.name.length >= 2){
        studentInitial = widget.studentData.name.substring(0,2);
      }else{
        studentInitial = widget.studentData.name[0];
      }
    }else{
      //No longer need to do a thing
    }
    if(widget.studentData.imageUrl.isNotEmpty){
      studentInitial = "";
    }
  }
  @override
  Widget build(BuildContext context){
    checkStudentName();
    logger.i("Called!");
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: FileImage(File(widget.studentData.imageUrl)),
                    maxRadius: 30,
                    child: Text(studentInitial),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.studentData.name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(widget.studentData.schoolName, style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.normal),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}