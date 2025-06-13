import 'dart:io';

class BankingSystem {
  String? name;
  String? accountNumber;
  double balance;

  BankingSystem({this.name, this.accountNumber, this.balance = 0.0});

  void depositMoney() {
    stdout.write("Enter amount to deposit: ");
    double? amount = double.tryParse(stdin.readLineSync() ?? "");
    if (amount != null && amount > 0) {
      balance += amount;
      print("✅ Deposited Rs $amount. New Balance: Rs $balance");
    } else {
      print("❌ Invalid deposit amount.");
    }
  }

  void withdrawMoney() {
    stdout.write("Enter amount to withdraw: ");
    double? amount = double.tryParse(stdin.readLineSync() ?? "");
    if (amount != null && amount > 0 && amount <= balance) {
      balance -= amount;
      print("✅ Withdrawn Rs $amount. Remaining Balance: Rs $balance");
    } else {
      print("❌ Invalid or insufficient balance.");
    }
  }

  void checkBalance() {
    print("💰 Current Balance: Rs $balance");
  }

  @override
  String toString() {
    return 'Account Holder: $name\nAccount Number: $accountNumber\nBalance: Rs $balance';
  }
}

void banking() {
  final Map<String, BankingSystem> accounts = {};

  print("🏠 Welcome to Dart Bank!");

  while (true) {
    print("\n===== MAIN MENU =====");
    print("1. Create Account");
    print("2. Login Account");
    print("3. Exit");

    stdout.write("Choose an option: ");
    int? choice = int.tryParse(stdin.readLineSync() ?? "");

    switch (choice) {
      case 1:
        createAccount(accounts);
        break;
      case 2:
        loginAccount(accounts);
        break;
      case 3:
        print("🙏 Thank you for using Dart Bank!");
        return;
      default:
        print("❌ Invalid option. Try again.");
    }
  }
}

void createAccount(Map<String, BankingSystem> accounts) {
  stdout.write("👤 Enter your name: ");
  String? name = stdin.readLineSync();
  stdout.write("🔢 Create your account number: ");
  String? accNum = stdin.readLineSync();

  if (name == null || name.isEmpty || accNum == null || accNum.isEmpty) {
    print("❌ Name and account number must not be empty.");
    return;
  }

  if (accounts.containsKey(accNum)) {
    print("⚠️ Account number already exists. Try a different one.");
    return;
  }

  accounts[accNum] = BankingSystem(name: name, accountNumber: accNum);
  print("✅ Account created successfully for $name.");
}

void loginAccount(Map<String, BankingSystem> accounts) {
  stdout.write("🔑 Enter your account number: ");
  String? accNum = stdin.readLineSync();

  if (accNum == null || !accounts.containsKey(accNum)) {
    print("❌ Account not found.");
    return;
  }

  BankingSystem currentAccount = accounts[accNum]!;

  while (true) {
    print("Hello, ${currentAccount.name}welcome to dart bank");
    print("Account number: ${currentAccount.accountNumber}");
    print("Balance: ${currentAccount.balance}");
    print("\n===== ACCOUNT MENU =====");
    print("1. Deposit Money");
    print("2. Withdraw Money");
    print("3. Check Balance");
    print("4. Logout");

    stdout.write("Choose an option: ");
    int? option = int.tryParse(stdin.readLineSync() ?? "");

    switch (option) {
      case 1:
        currentAccount.depositMoney();
        break;
      case 2:
        currentAccount.withdrawMoney();
        break;
      case 3:
        currentAccount.checkBalance();
        break;
      case 4:
        print("👋 Logged out.");
        return;
      default:
        print("❌ Invalid choice.");
    }
  }
}
