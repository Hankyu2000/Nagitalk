import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:nagisa_talk/libraries/file_controller.dart';

class AddStudentPage extends StatefulWidget{
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage>{
  late File imageFile;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 30, left: 5),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
                SizedBox(width: 2,),
                Text(
                  AppLocalizations.of(context)!.hConversations,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign:TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.formName
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.formSchoolName
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: MaterialButton(
                  onPressed: null,
                  child: Text(AppLocalizations.of(context)!.formPickImage),
                )
              ),
            ],
          )
        ),
    );
  }

  void _getAndSaveFromDevice({required ImageSource source, required String filename}) async {
    ImagePicker picker = ImagePicker();
    var imageFile = await picker.pickImage(source: source);
    if(imageFile == null){
      return;
    }
    var savedFile = await FileController.saveLocalImage(rawImage: imageFile, filename: filename);
    imageFile = savedFile;
  }

}

