import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
class Students {
  String name = "";
  String schoolName = "";
  String imageUrl = "";
  String uuid = "";

  Students({required String name, required String schoolName, required String imageUrl, required String uuid}) {
    this.uuid = uuid;
    this.name = name;
    this.imageUrl = imageUrl;
    this.schoolName = schoolName;
  }
}


