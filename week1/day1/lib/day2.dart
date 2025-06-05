import 'dart:io';

void student() {
  // print("Enter your name: ");
  stdout.write("Enter you name: ");
  var name = stdin.readLineSync();
  print(name);
}

int calculate() {
  stdout.write("Please enter the number you want to calculate: ");
  int a = int.parse(stdin.readLineSync() ?? '');
  int b = int.parse(stdin.readLineSync() ?? '');
  a + b;
  return a + b;
}

int andMul(int add) {
  stdout.write("Please Enter the number you want to multiply with: ");
  int mulnum = int.parse(stdin.readLineSync()!);
  return add * mulnum;
}

double div(int div) {
  stdout.write("Please enter the number you want to divide with: ");
  int divWith = int.parse(stdin.readLineSync()!);
  return div / divWith;
}
