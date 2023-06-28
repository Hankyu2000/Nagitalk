import 'package:flutter/material.dart';
import 'package:nagisa_talk/chatDetailPage.dart';

class StudentsList extends StatefulWidget{
  String name;
  String schoolName;
  String imageUrl;
  String uuid;
  StudentsList({required this.name, required this.schoolName, required this.imageUrl, required this.uuid});
  @override
  _StudentsListState createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList>{
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context){
              return ChatDetailPage();
            })
        );

      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(widget.uuid, style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.normal),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}