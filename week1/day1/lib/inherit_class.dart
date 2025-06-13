import 'dart:io';

class Bank {
  String? name;
  Customer? customer;
  Bank({this.name, this.customer});
}

class Customer {
  int? accNumber;
  double? balance;
  String? name;
  Customer({this.accNumber, this.balance, this.name});
}

void main() {
  List<Bank> bankDetails = [];
  for (int i = 1; i < 3; i++) {
    stdout.write("Enter the Banke name: ");
    String? bankName = stdin.readLineSync();

    stdout.write("Enter the customer name: ");
    String? customerNumber = stdin.readLineSync();
    stdout.write("Enter the customer balance: ");
    double? balance = double.parse(stdin.readLineSync() ?? "");
    stdout.write("Enter the customer acc: ");
    int? acc = int.parse(stdin.readLineSync() ?? "");

    Bank bank = Bank(
      name: bankName,
      customer:
          Customer(name: customerNumber, balance: balance, accNumber: acc),
    );
    bankDetails.add(bank);
  }
  stdout.write("Enter an account number to search: ");
  int? searchAcc = int.tryParse(stdin.readLineSync() ?? "");
  bool found = false;
  for (var bank in bankDetails) {
    if (searchAcc == bank.customer?.accNumber) {
      print("\nBank Name: ${bank.name}");
      print("Customer Name: ${bank.customer?.name}");
      print("Account Number: ${bank.customer?.accNumber}");
      print("Balance: \$${bank.customer?.balance}");
      found = true;
      break;
    }
  }
  if (!found) {
    print("No customer found with account number $searchAcc");
  }
}
