import 'dart:io';

import 'package:first/first.dart' as first;

void main(List<String> arguments) {
  print('Hello world: ${first.calculate()}!');
  stdout.write("Enter your name");
  var ishan = stdin.readLineSync();
  print("Your name is $ishan");
  first.Student();
}
