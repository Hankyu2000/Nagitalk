import 'dart:async';
import 'package:cross_file/cross_file.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class FileController {
  static Future get localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future saveLocalImage({required XFile rawImage, required String filename}) async{
    // Only for native
    File image = File(rawImage.path);
    final path = await localPath;
    final imagePath = "$path/$filename.png";
    File imageFile = File(imagePath);
    var savedFile = await image.copy(imagePath);
    return imagePath;
  }
}