import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

int counter = 1;
readFile() async {
  var result = await FilePicker.platform.pickFiles(allowMultiple: false);
  if (result == null) return;

  File filePath = File(result.files.first.path!);
  return await filePath.readAsString();
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  print(directory.path);
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/${counter++}.txt');
}

Future<File> writeCounter(String str) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString('$str');
}

wirteFile(String str) async {
  File file = File("/Users/rakanalotaibi/test/test.txt");
  file.writeAsStringSync(str);
}
