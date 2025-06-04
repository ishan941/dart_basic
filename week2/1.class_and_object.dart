import 'dart:io';

void main() {
  Student student = Student();
  student.name = stdin.readLineSync();
  student.age = int.parse(stdin.readLineSync()!);
  student.marks();
}

class Student {
  String? name;
  int? age;
  void marks() {
    stdout.write("$age is the Age of $name");
  }
}
