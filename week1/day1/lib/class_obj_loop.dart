import 'dart:ffi';
import 'dart:io';

class Student {
  int? roll;
  String? name;
  String? location;
  String? age;
  Student({this.age, this.location, this.name, this.roll});

  @override
  String toString() {
    return 'Student( name: $name, location: $location, age: $age)';
  }
}

void main(List<String> args) {
  List<Student> studenList = [];
  Map<int, Student> studentMap = {};
  int roll = 0;

  for (int i = 1; i < 5; i++) {
    roll += 1;
    stdout.write("Enter the name of the student: ");
    String? name = stdin.readLineSync();

    stdout.write("Enter the location of the student: ");
    String? location = stdin.readLineSync();
    Student student = Student(roll: roll, name: name, location: location);
    studenList.add(student);
    studentMap[roll] = student;
  }
  // for (var student in studenList) {
  //   print(
  //       "Roll no: ${student.roll}\nName: ${student.name}\nAge: ${student.age}\n ");
  // }
  for (var entry in studentMap.entries) {
    print('Roll: ${entry.key}, Data: ${entry.value}');
  }
}
