import 'dart:io';

votingSytem() {
  stdout.write("Please Enter you name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Please Enter you age: ");
  int age = int.parse(stdin.readLineSync()!);
  int illigableAge = 18;

  if (age <= illigableAge) {
    print(
        "$name You age is $age, you can't vote. You can vote after ${illigableAge - age} year");
  } else {
    print("$name your age is $age, You can vote");
  }
}

gradeSystem() {
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
  List<dynamic> dy = [1, "Venus", "Earth", "Mars"];
  List<int> inta = [1, 1, 3, 4];
  List he = [1, 1, 1.1];
  List a = [1, " as", 1.1];
}
