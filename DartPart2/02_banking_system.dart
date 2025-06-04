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

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("Deposited: \$${amount.toStringAsFixed(2)}");
    } else {
      print("Invalid deposit amount.");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print("Withdrawn: \$${amount.toStringAsFixed(2)}");
    } else {
      print("Invalid withdraw amount or insufficient balance.");
    }
  }

  void displayBalance() {
    print("Current balance: \$${balance.toStringAsFixed(2)}");
  }
}

void main() {
  print("Welcome to Dart Bank!");
  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter your account number: ");
  String? accNumber = stdin.readLineSync();

  if (name == null || accNumber == null) {
    print("Invalid input. Exiting...");
    return;
  }

  BankAccount account = BankAccount(name: name, accountNumber: accNumber);

  while (true) {
    print("\n======== MENU ========");
    print("1. Deposit Money");
    print("2. Withdraw Money");
    print("3. Check Balance");
    print("4. Exit");
    stdout.write("Choose an option: ");

    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? "");

    switch (choice) {
      case 1:
        stdout.write("Enter amount to deposit: ");
        String? depInput = stdin.readLineSync();
        double? amount = double.tryParse(depInput ?? "");
        if (amount != null) {
          account.deposit(amount);
        } else {
          print("Invalid amount.");
        }
        break;

      case 2:
        stdout.write("Enter amount to withdraw: ");
        String? withInput = stdin.readLineSync();
        double? amount = double.tryParse(withInput ?? "");
        if (amount != null) {
          account.withdraw(amount);
        } else {
          print("Invalid amount.");
        }
        break;

      case 3:
        account.displayBalance();
        break;

      case 4:
        print("Thank you for using Dart Bank. Goodbye!");
        return;

      default:
        print("Invalid choice. Please try again.");
    }
  }
}
