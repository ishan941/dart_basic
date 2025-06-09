import 'dart:ffi';
import 'dart:io';

class BankingSystem {
  String? name;
  String? accountNumber;
  double balance;
  BankingSystem({this.name, this.accountNumber, this.balance = 0.0});

  final Map<String, BankingSystem> accounts = {};

  openBank() {
    print("🏠 Welcome to dart bank");

    while (true) {
      print("\n=====Main MENU====");
      print("1. Create Account");
      print("2. Login Account");
      print("3. Exit");

      stdout.write("Choose an option: ");

      int input = int.parse(stdin.readLineSync() ?? "");

      switch (input) {
        case 1:
          createAccount();
          break;
        case 2:
          loginAccount();
          break;
        case 3:
          print("Thank you for using Dart Bank 😝");
          return;
        default:
          print("❌ Sorry invalid.");
      }
    }
  }

  void createAccount() {
    stdout.write("👱‍♂️ Enter you name: ");
    String? name = stdin.readLineSync();
    stdout.write("Create you account Number: ");
    String? accNumber = stdin.readLineSync();

    if (name == null ||
        name.isEmpty ||
        accNumber == null ||
        accNumber.isEmpty) {
      print("Your name or acc number should not be empty");
      return;
    }
    if (accounts.containsKey(accNumber)) {
      print("Account number already exits. Please try again.");
      return;
    }

    accounts[accNumber] = BankingSystem(name: name, accountNumber: accNumber);
    print(
        "Account created successfully for $name\n with account number$accNumber");
    print(accounts);
  }

  void loginAccount() {
    stdout.write("Enter you account number");
    String? accNumber = stdin.readLineSync();

    if (accNumber == null || !accounts.containsKey(accNumber)) {
      print("Account number not found");
      return;
    }
    BankingSystem account = accounts[accNumber]!;
    print("Welcome, ${account.name}");
    print(account);

    while (true) {
      print("\n-----Account MENU ${account.accountNumber}----");
      print("1. Deposite Money");
      print("2. Withdraw Money");
      print("3. Check Balance");
      print("4. Logout");
      stdout.write("Choose an option: ");

      int? input = int.parse(stdin.readLineSync() ?? "");

      switch (input) {
        case 1:
          account.depositeMoney();
          break;
        case 2:
          withDrawModey();
          break;
        case 3:
          checkBalance();
          break;
        case 4:
          break;
        default:
      }
    }
  }

  depositeMoney() {
    stdout.write("Enter the amount you want to deposite: ");
    double? amount = double.parse(stdin.readLineSync() ?? "");
    if (amount > 0) {
      balance = balance + amount;
      print("Deposited: Rs $amount\n Total: Rs $balance");
    } else {
      print("Invalid");
    }
  }

  withDrawModey() {
    stdout.write("Enter the amount you want to withdraw: ");
    double? amount = double.parse(stdin.readLineSync() ?? "");
    if (amount > 0 || amount <= balance) {
      balance = balance - amount;
      print("Withdraw amount: Rs $amount");
      print("💰 Current balance: Rs ${balance.toStringAsFixed(2)}");
    } else {
      print("Invalid");
    }
  }

  checkBalance() {
    print("💰 Current balance: \Rs ${balance.toStringAsFixed(2)}");
  }
}
