import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nagisa_talk/models/dbs/studentsDataBase.dart';
import 'package:nagisa_talk/models/studentsModel.dart';
import 'package:nagisa_talk/widgets/studentsList.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'dart:async';
import 'package:nagisa_talk/libraries/fileController.dart';

class AddStudentPage extends StatefulWidget{
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage>{
  late final database = StudentsDatabase();
  late File imageFile;
  final uuidObject = Uuid();
  String _filePath = "";
  late final currentUUID = uuidObject.v4();
  late Student sampleStudent = Student(uuid: currentUUID, name: "サンプル生徒", imageUrl: "", schoolName: "連邦捜査部シャーレ");
  final TextEditingController nameFieldController = TextEditingController();
  final TextEditingController schoolNameFieldController = TextEditingController();

  @override
  void initState(){
    super.initState();
    nameFieldController.addListener(onNameFieldChanged);
    schoolNameFieldController.addListener(onSchoolNameFieldChanged);
  }

  void onNameFieldChanged(){
    setState(() {
      sampleStudent.name = nameFieldController.text;
    });
  }

  void onSchoolNameFieldChanged(){
    setState(() {
      sampleStudent.schoolName = schoolNameFieldController.text;
    });
  }


  @override
  void dispose(){
    nameFieldController.dispose();
    schoolNameFieldController.dispose();
    super.dispose();
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
                  controller: nameFieldController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.formSchoolName
                  ),
                  controller: schoolNameFieldController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: MaterialButton(
                  onPressed: () async{
                    String? _filePathObj = await _getAndSaveFromDevice(source: ImageSource.gallery, filename: currentUUID);
                    setState(() {
                        _filePath = _filePathObj!;

                    });
                  },
                  child: Text(AppLocalizations.of(context)!.formPickImage),
                )
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(_filePath)
              ),
              Container(
                child: StudentsList(studentData: sampleStudent,),
              )
            ],
          )
        ),
    );
  }

  Future<String?> _getAndSaveFromDevice({required ImageSource source, required String filename}) async {
    ImagePicker picker = ImagePicker();
    var imageFile = await picker.pickImage(source: source);
    if(imageFile == null){
    return "";
  }
  var savedFilePath = await FileController.saveLocalImage(rawImage: imageFile, filename: filename);
  return savedFilePath;
  }

}

