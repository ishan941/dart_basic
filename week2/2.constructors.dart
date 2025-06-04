import 'dart:io';

void main() {
  stdout.write("Please Enter your details");
  String name = stdin.readLineSync() ?? "";
  int age = int.parse(stdin.readLineSync()!);
  Student student = Student(name, age);
  print("${student.name}'s age is $age");
  Nist nist = Nist(program: name, year: name, sem: name, course: name);
  print(
      "Program: ${nist.program} Year: ${nist.program} Sem: ${nist.program} Cource: ${nist.program} ");

  Employee employee = Employee("Ishan", 1000);
  employee.display();
  Employee guest = Employee.guest();
  guest.display();
}

class Student {
  String? name;
  int? age;
  Student(this.name, this.age);
}

class Nist {
  String? program;
  String? year;
  String? sem;
  String? course;
  Nist(
      {required this.program,
      required this.year,
      required this.sem,
      required this.course});
}

class Employee {
  String? employee;
  int? salary;
  Employee(this.employee, this.salary);
  Employee.guest() {
    employee = "Ishan";
    salary = 20000;
  }
  void display() {
    print("Name: $employee, Age = $salary ");
  }
}
