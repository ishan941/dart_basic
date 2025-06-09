//vs code setup
//git setup
//flutter sdk setup

import 'dart:io';

import 'package:main/class_obj1.dart';
import 'package:main/voting_system.dart';

void main() {
//   int sum = calculate();
//   //Calulate ma sum gareko xa

//   //int calculate() {
//   // stdout.write("Please enter the number you want to calculate: ");
//   // int a = int.parse(stdin.readLineSync() ?? '');
//   // int b = int.parse(stdin.readLineSync() ?? '');
//   // a + b;
//   // return a + b;
//   // }

//   print("The sum of Two number is $sum");
//   //
//   // a ra b sum gareko display garyo

//   int mul = andMul(sum);
// //sum ko value parameter ma pathayo addmul function ma
// //

// //   int andMul(int add) {
// //   stdout.write("Please Enter the number you want to multiply with: ");
// //   int mulnum = int.parse(stdin.readLineSync()!);
// //
// //// aani ya chai parameter ma aako sum ko value mulnum sanga multiply gardeyoo
// //   return add * mulnum;
// // }

//   print("The Multiplactionof  sum of Two number is $mul");

//   //same
//   double divnum = div(mul);
//   print("The division of all the numbers: $divnum ");
//   print("(Sum = $sum * Mul = $mul) / $divnum");

  // votingSytem();
  // gradeSystem();
  // gradeSystem();
  // gs();
  // final today = DateTime.now();
  // print(today);
  // BankingSystem bankingSystem = BankingSystem();
  // bankingSystem.openBank();
  // votingSytem();
  String? call = stdin.readLineSync();
  Car car = Car(brand: call, year: call);

  print("${car.brand}, ${car.year}");
}
