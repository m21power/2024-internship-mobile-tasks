import 'dart:io';

String fixture(String name) {
  final path = 'test/features/fixtures/$name';
  final file = File(path);

  // Print the absolute path for debugging
  //print('Reading file from: ${file.absolute.path}');

  // Check if the file exists
  if (!file.existsSync()) {
    throw Exception('File not found: $path');
  }

  return file.readAsStringSync();
}
