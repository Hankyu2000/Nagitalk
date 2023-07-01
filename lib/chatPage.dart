import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'package:nagisa_talk/libraries/chatController.dart';
import 'package:nagisa_talk/main.dart';
import 'package:nagisa_talk/models/conversationModel.dart';
import 'package:nagisa_talk/models/messageModel.dart';
import 'package:nagisa_talk/widgets/conversationList.dart';

import 'package:nagisa_talk/models/studentsModel.dart';

class ChatPage extends StatefulWidget {
  final chatController = ChatController(database: studentsDatabase);
  final nagisa = Student(uuid: "7310f918-55a4-406c-bd3a-4fcd1c7963be", name: "桐藤 ナギサ", imageUrl: "E:\\Docs/7310f918-55a4-406c-bd3a-4fcd1c7963be.png", schoolName: "トリニティ総合学園");
  late Future<List<Conversation>> conversations;
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final logger = Logger();


  late List<Message> messages = [
    Message(
        sender: widget.nagisa,
        messageUUID: "d1cedc7d-0653-48dc-8718-013a619ca861",
        messageText: "ごきげんよう、先生。",
        conversationUUID: "4f9b75ab-4fc9-4933-8bc7-bce3724971ee"
    ),
  ];

  late List<Conversation> sampleConversation = [Conversation(conversationName: "桐藤 ナギサ", participatedStudents: [widget.nagisa], messages: messages, conversationUUID: "b0d423a7-26ae-4fec-8c12-810aca442d7b")];

  Future<List<Conversation>> appendElements(Future<List<Conversation>> listFuture, List<Conversation> elementsToAdd) async {
    final list = await listFuture;
    list.addAll(elementsToAdd);
    return list;
  }

  @override
  void initState(){
    super.initState();
    widget.conversations = widget.chatController.getConversationList();
    widget.conversations = appendElements(widget.conversations, sampleConversation);
  }


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
                      AppLocalizations.of(context)!.hConversations,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
                future: widget.conversations,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    //logger.i(snapshot.data![0].conversationName);
                    if(snapshot.hasError){
                      return Text("エラー： ${snapshot.error}");
                    }
                    if(!snapshot.hasData){
                      return Text("データがありません");
                    }
                    if(snapshot.data!.isNotEmpty){
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 16),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index){
                          logger.i(snapshot.data!.length);
                          return Dismissible(key: Key(snapshot.data![index].conversationUUID),
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
                                  final backupConversation = snapshot.data![index];
                                  setState((){
                                    snapshot.data!.removeAt(index);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.itemDismissed(backupConversation.conversationName))));
                                  studentsDatabase.deleteConversation(backupConversation.conversationUUID);
                                  studentsDatabase.deleteAllMessageBelongsToConversation(backupConversation.conversationUUID);
                                  return true;
                                }else{
                                  return false;
                                }
                              });
                            },
                            child: ConversationList(
                                  conversation: snapshot.data![index],
                            )
                          );
                        },
                      );
                    }else{
                      return Container(
                        alignment: Alignment.center,
                        child: Center(child: Text("新規会話を作成しましょう", style: TextStyle(fontSize: 50),),),
                      );
                    }

                  }else {
                    // 処理中の表示
                    return const CircularProgressIndicator();
                  }
                },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.chatController.newConversation();
          setState((){
            widget.conversations = widget.chatController.getConversationList();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}