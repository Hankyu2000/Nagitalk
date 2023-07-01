import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nagisa_talk/libraries/chatController.dart';
import 'package:nagisa_talk/main.dart';
import 'package:nagisa_talk/models/messageModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io';
import 'package:nagisa_talk/models/studentsModel.dart';

class ChatDetailPage extends StatefulWidget{
  late final List<Student> participatingStudents;
  final nagisa = Student(uuid: "7310f918-55a4-406c-bd3a-4fcd1c7963be", name: "桐藤 ナギサ", imageUrl: "E:\\Docs/7310f918-55a4-406c-bd3a-4fcd1c7963be.png", schoolName: "トリニティ総合学園");
  final sensei = Student(name: "先生", schoolName: "シャーレ", imageUrl: "", uuid: "86742a38-ad29-4541-bcc5-c6211ad5dd13");
  late final List<Message> messages = [
    Message(messageText: "ごきげんよう、先生。", sender: nagisa, conversationUUID: "e3c236c2-7526-46e4-a519-dfc2ab99119d", messageUUID: "c5037cc3-bdae-4735-af49-b04e8b3deae7"),
    Message(messageText: "おはようございます、陛下。", sender: sensei, conversationUUID: "e3c236c2-7526-46e4-a519-dfc2ab99119d", messageUUID: "c5037cc3-bdae-4735-af49-b04e8b3deae7"),
    Message(messageText: "ふふっ、先生。それは堅苦しすぎではありませんか？", sender: nagisa, conversationUUID: "e3c236c2-7526-46e4-a519-dfc2ab99119d", messageUUID: "c5037cc3-bdae-4735-af49-b04e8b3deae7"),
    Message(messageText: "それだけ高貴な方なのですよ？陛下は。", sender: sensei, conversationUUID: "e3c236c2-7526-46e4-a519-dfc2ab99119d", messageUUID: "c5037cc3-bdae-4735-af49-b04e8b3deae7"),
    Message(messageText: "それは嬉しいですね…♪", sender: nagisa, conversationUUID: "e3c236c2-7526-46e4-a519-dfc2ab99119d", messageUUID: "c5037cc3-bdae-4735-af49-b04e8b3deae7"),
  ];

  // ChatDetailPage({required this.participatingStudents, required this.messages});
  ChatDetailPage({required this.participatingStudents});
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage>{
  final List<ImageProvider<Object>> _participatingStudentsAvatar = [];
  late final TextEditingController chatBoxController = TextEditingController();
  final students = studentsDatabase.allStudentEntries;
  void _updateStudentAvatars() {
    for (var student in widget.participatingStudents) {
      _participatingStudentsAvatar.add(FileImage(File(student.imageUrl)));
    }
  }

  List<String> _getStudentsNameList() {
    List<String> studentsNames = [];
    for (var student in widget.participatingStudents){
      studentsNames.add(student.name);
    }
    return studentsNames;
  }
  final logger = Logger();

  @override
  void initState(){
    super.initState();
    logger.i(widget.messages);
    _updateStudentAvatars();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
                  SizedBox(width: 2,),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.1),
                    child: AvatarStack(
                        avatars: _participatingStudentsAvatar, height: 50),
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_getStudentsNameList().join(', ')),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.settings, color: Colors.black54,),
                  )
                ],
              ),
            ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: widget.messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              logger.i("chat detail called.");
              logger.i(widget.messages);
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Align(
                  alignment: (widget.messages[index].sender.schoolName) != "シャーレ"?Alignment.topLeft:Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (widget.messages[index].sender.schoolName) != "シャーレ"?Colors.grey.shade200:Colors.blue[200],
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(widget.messages[index].messageText, style: TextStyle(fontSize: 15),),
                  ),
                )
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height:60,
                  width:double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: [

                        ]
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height:60,
                  width:double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(Icons.add, color:Colors.white, size:20),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Expanded(
                          child: TextField(
                            controller: chatBoxController,
                            decoration: InputDecoration(
                              hintText: "Write Message...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none,
                            ),
                          )
                      ),
                      SizedBox(width: 15,),
                      FloatingActionButton(onPressed: (){
                        setState(() {
                          widget.messages.add(Message(sender: Student(name: "先生", schoolName: "シャーレ", imageUrl: "", uuid: "86742a38-ad29-4541-bcc5-c6211ad5dd13"), messageText: chatBoxController.text, messageUUID: "749a1dc7-c866-4754-b417-ce8ba5d7a7db", conversationUUID: "4f9b75ab-4fc9-4933-8bc7-bce3724971ee"));
                        });
                      },
                        child: Icon(Icons.send, color: Colors.white, size: 18,),
                        backgroundColor: Colors.blue,
                        elevation: 0,
                      ),
                      SizedBox(width: 15,),
                    ],
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}