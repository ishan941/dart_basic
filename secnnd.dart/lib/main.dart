import 'dart:io';

import 'package:secnnd/secnnd.dart';

void main() {
  print('Hello from main.dart!');

  Ishan ishan = Ishan();
  ishan.ishan();
  print(ishan.ishan());

  ishan.shrestha();
  ishan.grade(12);
  int a = int.parse(stdin.readLineSync() ?? "");
  print(" The Name is ${ishan.ishan()}, The class is ${ishan.grade(a)}");
}
