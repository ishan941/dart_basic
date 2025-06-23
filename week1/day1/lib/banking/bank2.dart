import 'dart:io';

class BankingSystem {
  String? name;
  String? accountNumber;
  double balance;

  BankingSystem({this.accountNumber, this.balance = 0.0, this.name});

  void deposit() {
    print("Enter the amount you want to deposit:");
    double? amount = double.tryParse(stdin.readLineSync() ?? "");

    if (amount != null && amount > 0) {
      balance += amount;
      print("✅ Deposited Rs $amount. Current Balance: Rs $balance");
    } else {
      print("❌ Invalid amount.");
    }
  }

  void withdrawal() {
    print("Total available balance: Rs $balance");
    print("Enter the amount you want to withdraw:");
    double? amount = double.tryParse(stdin.readLineSync() ?? "");

    if (amount != null && amount > 0 && amount <= balance) {
      balance -= amount;
      print("✅ Withdrawn Rs $amount. Remaining Balance: Rs $balance");
    } else {
      print("❌ Invalid amount or insufficient balance.");
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

void main() {
  openBank();
}

void openBank() {
  Map<String, BankingSystem> accounts = {};

  while (true) {
    print("\n==== Main Menu ====");
    print("1️⃣  Create an account");
    print("2️⃣  Login to account");
    print("3️⃣  Exit");

    int? choice = int.tryParse(stdin.readLineSync() ?? "");

    switch (choice) {
      case 1:
        createAnAccount(accounts);
        break;

      case 2:
        login(accounts);
        break;

      case 3:
        print("🙏 Thank you for using our bank.");
        return;

      default:
        print("❌ Invalid choice. Please try again.");
    }
  }
}

void createAnAccount(Map<String, BankingSystem> accounts) {
  print("\n=== Create an Account ===");

  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter your account number: ");
  String? accNo = stdin.readLineSync();

  if (name == null || name.isEmpty || accNo == null || accNo.isEmpty) {
    print("❌ Please fill in all fields.");
    return;
  }

  if (accounts.containsKey(accNo)) {
    print("❌ Account number already taken.");
    return;
  }

  accounts[accNo] = BankingSystem(name: name, accountNumber: accNo);
  print("🎉 Hello $name, your account has been created successfully!");
}

void login(Map<String, BankingSystem> accounts) {
  print("\n=== Login to Account ===");

  stdout.write("Enter your account number: ");
  String accNo = stdin.readLineSync() ?? "";

  if (!accounts.containsKey(accNo)) {
    print("❌ Invalid account number.");
    return;
  }

  BankingSystem userAccount = accounts[accNo]!;

  print("\n✅ Welcome, ${userAccount.name}!");

  while (true) {
    print("\n==== Account Menu ====");
    print("1️⃣  Deposit");
    print("2️⃣  Withdraw");
    print("3️⃣  Check Balance");
    print("4️⃣  Logout");

    int? choice = int.tryParse(stdin.readLineSync() ?? "");

    switch (choice) {
      case 1:
        userAccount.deposit();
        break;

      case 2:
        userAccount.withdrawal();
        break;

      case 3:
        userAccount.checkBalance();
        break;

      case 4:
        print("👋 Successfully logged out.");
        return;

      default:
        print("❌ Invalid choice. Please try again.");
    }
  }
}
