import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class FilePickerHandler {


  static Future<PlatformFile?> getFile()async{

    var result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt']
    );

    return result?.files.firstOrNull;
  }
}
