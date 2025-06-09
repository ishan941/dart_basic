import 'dart:convert';
import 'dart:io';

gs() {
  stdout.write("Enter you name: ");
  String name = stdin.readLineSync()!;
  stdout.write("Enter you age: ");
  int age = int.parse(stdin.readLineSync()!);
  stdout.write("Enter you class: ");
  int clas = int.parse(stdin.readLineSync()!);
  stdout.write("Enter you obtain marks: ");
  double marks = double.parse(stdin.readLineSync()!);

  String gpa = "";
  if (marks > 90) {
    gpa = "A+";
  } else if (marks > 80) {
    gpa = "A";
  } else if (marks > 70) {
    gpa = "B+";
  } else if (marks > 60) {
    gpa = "B";
  } else if (marks > 50) {
    gpa = "C+";
  } else if (marks > 40) {
    gpa = "C";
  } else {
    gpa = "F";
  }

  switch (gpa) {
    case "A+":
      print("You got A+");
      break;
    case "A":
      print("You got A");
      break;

    case "B+":
      print("You got B+");
      break;

    case "B":
      print("You got B");
      break;

    case "C+":
      print("You got C");
      break;
    case "F":
      print("You failed. Try again next time.");
      break;
    default:
      print("Invalid GPA.");
  }

  //Ternary operator
  gpa == "A+" ? print("You got selected") : print("You are not selected");
  // single (=) lay value asign garxa
  //double ( == )lay compare garxa
  //
  // gpa ma vako value lay compare garxa
  //yeti gpa A+ ho vane "You got selected"
  // first koi linxa
  //hoina vane "You are not selected"
  //paxadi ko linxa

  //key value pair
  //javascript object notation
  //key must have unique value
  //so fetch or process fast
  Map<String, dynamic> grade = {
    "marks": marks,
    "Grade": gpa,
    "gpa": marks / 25
  };

  Map<String, dynamic> sDetails = {
    "name": name,
    "age": age,
    "grade": clas,
  };
  Map<String, dynamic> data = {
    "Student Details": sDetails,
    "Grade": grade,
  };
  String jsonString = jsonEncode(data);

  print(jsonString);
}
