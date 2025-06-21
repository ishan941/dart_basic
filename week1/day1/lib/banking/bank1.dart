import 'dart:ffi';
import 'dart:io';

openBank() {
  Map<String, BankingSystem> account = {};

  while (true) {
    print("Welcom");
    print("Choose");
    print("1. Create an Acount");
    print("2. Login to account");
    print("3. Exit");

    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        createAccount(account);
        break;
      case 2:
        login(account);
        break;
      case 3:
        print("Thank you for using our bank");
        return;
      default:
        print("INVALID CHOICE");
    }
  }
}

createAccount(Map<String, BankingSystem> account) {
  stdout.write("Enter you name: ");
  String? name = stdin.readLineSync();
  stdout.write("Enter you Account Number: ");
  String? accNo = stdin.readLineSync();
  if (accNo == null || accNo.isEmpty) {
    print("Your accno should not be emply");
    return;
  }
  if (account.containsKey(accNo)) {
    print("⚠️ Account number already exists. Try a different one.");
    return;
  }
  account[accNo] = BankingSystem(name: name, accountNumber: accNo);
  print(
      "HELLO $name you account has been  Created successfully  with account Number $accNo");
}

login(Map<String, BankingSystem> account) {
  BankingSystem bankingSystem = BankingSystem();
  stdout.write("Enter you account number");
  String? accNo = stdin.readLineSync();

  if (account.containsKey(accNo)) {
    while (true) {
      print("1. Deposit Money");
      print("2. Withdraw Money");
      print("3. Check Balance");
      print("4. Delete account");
      print("5. Logout");

      int choice = int.parse(stdin.readLineSync()!);
      switch (choice) {
        case 1:
          bankingSystem.deposit();
          break;
        case 2:
          bankingSystem.withdrawl();
          break;
        case 3:
          bankingSystem.checkBalance();
          break;
        case 4:
          account.remove(accNo);

          return;
        case 5:
          return;
      }
    }
  }
}

class BankingSystem {
  String? name;
  String? accountNumber;
  Double? balance;

  BankingSystem({this.name, this.accountNumber, this.balance});

  BankingSystem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    accountNumber = json['accountNumber'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['accountNumber'] = this.accountNumber;
    data['balance'] = this.balance;
    return data;
  }

  deposit() {
    print("Enter the amount you want to deposite");
  }

  withdrawl() {}
  checkBalance() {}
}

void main() {
  openBank();
}
