import 'dart:io';

void main() {
  print("HEllo my name is Ishan Sjresyja");

  print("Please choose a number");
  print("1");
  print("2");
  print("3");
  print("4");

  String? choose = stdin.readLineSync();
  int? chooseNum = int.tryParse(choose ?? "0");
  chooseOpot(chooseNum);
}

void chooseOpot(int? num) {
  stdout.write(" Choosen number is $num");
  if (num == 1) {
    print("You choose 1");
  }
  switch (num) {
    case 1:
      print("You choose is $num");
      print("1");
      print("5");
      print("6");
      print("7");
      String? choose = stdin.readLineSync();
      int? chooseNum = int.tryParse(choose ?? "0");
      caseFirst(chooseNum);
    case 2:
      print("You choose is $num");
      print("1");
      print("3");
      print("3");
      print("4");
    case 3:
      print("1");
      print("3");
      print("3");
      print("4");
    case 4:
      print("1");
      print("2");
      print("4");
      print("4");
    case 5:
      print("1");
      print("2");
      print("5");
      print("5");
  }
}

caseFirst(int? chase) {
  stdout.write("Hello");
}
