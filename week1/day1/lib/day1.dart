import 'dart:convert';
import 'dart:io';

variab() {
  //Name
  stdout.write("Enter the name of the student: ");
  String name = stdin.readLineSync() ?? "";

  // Age
  stdout.write("Enter the name of the age: ");
  int age = int.parse(stdin.readLineSync() ?? "");

  //Grade
  stdout.write("Enter the name of the grade: ");
  int grade = int.parse(stdin.readLineSync() ?? "");

  // Faculty
  stdout.write("Enter the name of the faculty: ");
  String? faculty = stdin.readLineSync();

//List
  List<dynamic> inList = [name, age, grade, faculty];
  print(inList);

  Map<String, dynamic> jsonList = {
    "name": inList,
    "age": age,
    "grade": grade,
    "faculty": faculty
  };
  Map<int, dynamic> json1List = {1: inList, 2: jsonList, 3: grade, 4: faculty};
  print(json1List);
}
