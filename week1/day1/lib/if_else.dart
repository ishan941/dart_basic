import 'dart:convert';
import 'dart:io';

gradeSystem() {
  stdout.write("Enter you name");
  String name = stdin.readLineSync()!;

  stdout.write("Enter you age");
  int age = int.parse(stdin.readLineSync()!);

  stdout.write("Enter you grade");
  var grade = stdin.readLineSync();

  Map<String, dynamic> jsonList = {
    "name": name,
    "age": age,
    "grade": grade,
  };
  print(jsonList);
  stdout.write("Please Enter you grade: ");
  double marks = double.parse(stdin.readLineSync()!);
  String gpa = "";

  if (marks > 90) {
    gpa = "A+";
  } else if (marks > 80 && marks <= 90) {
    gpa = "A";
  } else if (marks > 70 && marks <= 80) {
    gpa = "B+";
  } else if (marks > 60 && marks <= 70) {
    gpa = "B";
  } else if (marks > 50 && marks <= 60) {
    gpa = "C";
  } else {
    print("You failed");
  }

  switch (gpa) {
    case "A+":
      print("Congraluation you got more than 90 percentage");
      break;
    case "A":
      print("You got B+");
      break;
    default:
      print("Invalid Grade");
  }

  Map<String, dynamic> studentGrade = {
    "Gpa": gpa,
    "Marks": marks,
    "grade": grade,
  };
}
