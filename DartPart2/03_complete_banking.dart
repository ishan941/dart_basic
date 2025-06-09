import 'dart:io';

class BankAccount {
  String name;
  String accountNumber;
  double balance;

  BankAccount({
    required this.name,
    required this.accountNumber,
    this.balance = 0.0,
  });

  final Map<String, BankAccount> accounts = {};

  choose() {
    print("🏦 Welcome to Dart Bank System");

    while (true) {
      print("\n======== MAIN MENU ========");
      print("1. Create Account");
      print("2. Login to Account");
      print("3. Exit");
      stdout.write("Choose an option: ");
      String? input = stdin.readLineSync();
      int? choice = int.tryParse(input ?? "");

      switch (choice) {
        case 1:
          createAccount();
          break;
        case 2:
          loginAccount();
          break;
        case 3:
          print("👋 Thank you for using Dart Bank. Goodbye!");
          return;
        default:
          print("❌ Invalid option. Try again.");
      }
    }
  }

  void createAccount() {
    stdout.write("👤 Enter your name: ");
    String? name = stdin.readLineSync();

    stdout.write("📄 Create an account number: ");
    String? accNumber = stdin.readLineSync();

    if (name == null ||
        accNumber == null ||
        name.isEmpty ||
        accNumber.isEmpty) {
      print("❌ Invalid input.");
      return;
    }

    if (accounts.containsKey(accNumber)) {
      print("⚠️ Account number already exists.");
      return;
    }

    accounts[accNumber] = BankAccount(name: name, accountNumber: accNumber);
    print(
        "✅ Account created successfully for $name with account number $accNumber");
  }

  void loginAccount() {
    stdout.write("🔐 Enter your account number: ");
    String? accNumber = stdin.readLineSync();

    if (accNumber == null || !accounts.containsKey(accNumber)) {
      print("❌ Account not found.");
      return;
    }

    BankAccount account = accounts[accNumber]!;
    print("👋 Welcome, ${account.name}!");

    while (true) {
      print("\n---- ACCOUNT MENU (${account.accountNumber}) ----");
      print("1. Deposit Money");
      print("2. Withdraw Money");
      print("3. Check Balance");
      print("4. Logout");
      stdout.write("Choose an option: ");

      String? input = stdin.readLineSync();
      int? choice = int.tryParse(input ?? "");

      switch (choice) {
        case 1:
          stdout.write("Enter amount to deposit: ");
          String? dep = stdin.readLineSync();
          double? amount = double.tryParse(dep ?? "");
          if (amount != null) {
            account.deposit(amount);
          } else {
            print("❌ Invalid amount.");
          }
          break;
        case 2:
          stdout.write("Enter amount to withdraw: ");
          String? wit = stdin.readLineSync();
          double? amount = double.tryParse(wit ?? "");
          if (amount != null) {
            account.withdraw(amount);
          } else {
            print("❌ Invalid amount.");
          }
          break;
        case 3:
          account.displayBalance();
          break;
        case 4:
          print("🚪 Logged out successfully.");
          return;
        default:
          print("❌ Invalid choice.");
      }
    }
  }

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("✅ Deposited: \Rs ${amount.toStringAsFixed(2)}");
    } else {
      print("❌ Invalid deposit amount.");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print("✅ Withdrawn: \Rs ${amount.toStringAsFixed(2)}");
      print("💰 Current balance: \Rs ${balance.toStringAsFixed(2)}");
    } else {
      print("❌ Invalid withdraw amount or insufficient balance.");
    }
  }

  void displayBalance() {
    print("💰 Current balance: \Rs ${balance.toStringAsFixed(2)}");
  }
}
