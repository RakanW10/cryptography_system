import 'dart:io';

import 'package:file_picker/file_picker.dart';

readFile() async {
  var result = await FilePicker.platform.pickFiles(allowMultiple: false);
  if (result == null) return;

  File filePath = File(result.files.first.path!);
  return await filePath.readAsString();
}

writeFile({required String name, required String str}) async {
  var f = await FilePicker.platform.saveFile(fileName: name);
  if (f == null) return;
  File(f).writeAsStringSync(str);
}
