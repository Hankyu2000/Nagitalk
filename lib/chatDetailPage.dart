import 'package:flutter/material.dart';
import 'package:nagisa_talk/widgets/chatMessageModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

class ChatDetailPage extends StatefulWidget{
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage>{
  final random = math.Random();
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "ごきげんよう、先生。", messageType: "receiver"),
    ChatMessage(messageContent: "おはようございます、陛下。", messageType: "sender"),
    ChatMessage(messageContent: "ふふっ、先生。それは堅苦しすぎではありませんか？", messageType: "receiver"),
    ChatMessage(messageContent: "それだけ高貴な方なのですよ？陛下は。", messageType: "sender"),
    ChatMessage(messageContent: "それは嬉しいですね…♪", messageType: "receiver"),
  ];
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
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://pbs.twimg.com/profile_images/1643761515420610560/srBvbPUm_400x400.jpg"),
                    maxRadius: 20,
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("桐藤 ナギサ"),
                        SizedBox(height: 6,),
                        Text(random.nextBool()?AppLocalizations.of(context)!.statusOnline:AppLocalizations.of(context)!.statusOffline ,style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
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
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Align(
                  alignment: (messages[index].messageType) == "receiver"?Alignment.topLeft:Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index]).messageType == "receiver"?Colors.grey.shade200:Colors.blue[200],
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                  ),
                )
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
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
                  const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Write Message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      )
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(onPressed: (){},
                    child: Icon(Icons.send, color: Colors.white, size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}