import 'dart:io';

void main() {
  // Ask for a number
  stdout.write("Please enter any number: ");
  String? aS = stdin.readLineSync(); // read input as string
  int? aI = int.tryParse(aS ?? "0"); // convert to integer safely

  // ✅ int.tryParse() is safer than int.parse() because it won’t crash if the input isn’t a valid number.

  // Ask for another input (text)
  stdout.write("Enter any text: ");
  String? a = stdin.readLineSync();

  // Variables of different types
  var c = "Hello"; // String
  var d = 1; // int
  double e = 1.1; // double
  const f = 1; // compile-time constant
  final g = 1.0; // runtime constant
  dynamic h = 1;
  dynamic i = 1.1;
  dynamic j = "hello";

/*
 var, const, and final correctly:

var → mutable variable with inferred type

const → compile-time constant

final → runtime constant (can be set once)

❌ The line import 'dart:ffi'; isn't needed here — it's used for native (C-style) function bindings and not required for basic I/O.*/

  // Printing outputs
  print("The number is $aI");
  print("The text is: $a");
  print("Combined: $a $aI");
  print("Mixed set: {$c, $d, $e, $f, $g}");
}
