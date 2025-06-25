import 'dart:io';

class MobileUser {
  String number;
  double balance;
  List<String> rechargeHistory;

  MobileUser({
    required this.number,
    this.balance = 0.0,
    List<String>? rechargeHistory,
  }) : rechargeHistory = rechargeHistory ?? [];

  recharge() {
    stdout.write("Enter the amount you want to recharge: ");
    double amt = double.parse(stdin.readLineSync()!);

    if (amt <= 0) {
      print("Amt should be greater than ");
      return;
    }

    balance += amt;
    rechargeHistory.add("Recharged ${amt.toStringAsFixed(2)}");
  }

  makeCall() {
    const double callAmtPerSecond = 0.1;
    stdout.write("Enter call duration in Second: ");
    int second = int.parse(stdin.readLineSync()!);
    if (second <= 0) {
      print("Please enter valid");
      return;
    }
    double totalCost = second * callAmtPerSecond;

    if (totalCost < balance) {
      balance -= totalCost;
      print("$totalCost has been deducted");
      rechargeHistory
          .add("Call: $second, cost: ${totalCost.toStringAsFixed(2)}");
    } else {
      print("You do not have enough balance for call");
    }
  }

  checkBalance() {
    print(balance);
  }

  showHistory() {
    print("\n📜 Recharge & Call History:");
    if (rechargeHistory.isNotEmpty) {
      for (var history in rechargeHistory) {
        print("- $history");
      }
    } else {
      print("No transactions yet.");
    }
  }
}

void main() {
  mobileRechargeSystem();
}

void mobileRechargeSystem() {
  Map<String, MobileUser> users = {};

  while (true) {
    print('\n📱 Mobile Recharge System');
    print('1. Register New Number');
    print('2. Login to Number');
    print('3. Exit');
    stdout.write('Enter your choice: ');

    try {
      int choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          registerUser(users);
          break;
        case 2:
          loginUser(users);
          break;
        case 3:
          print('🚪 Exiting...');
          return;
        default:
          print('❗ Invalid option. Try again.');
      }
    } catch (e) {
      print('⚠️ Error: Invalid input. Please enter a number.');
    }
  }
}

// Register new user
void registerUser(Map<String, MobileUser> users) {
  stdout.write('\n📞 Enter mobile number to register: ');
  String number = stdin.readLineSync()!;

  if (users.containsKey(number)) {
    print('❌ Number already registered.');
  } else {
    users[number] = MobileUser(number: number);
    print('✅ Number registered successfully!');
  }
}

void loginUser(Map<String, MobileUser> users) {
  stdout.write('\n🔐 Enter your mobile number: ');
  String number = stdin.readLineSync()!;

  if (!users.containsKey(number)) {
    print('❌ Number not found. Please register first.');
    return;
  }

  MobileUser user = users[number]!;

  while (true) {
    print('\n👤 Welcome, $number');
    print('1. Recharge Balance');
    print('2. Make a Call');
    print('3. Check Balance');
    print('4. View Recharge History');
    print('5. Logout');
    stdout.write('Choose an option: ');

    try {
      int option = int.parse(stdin.readLineSync()!);
      switch (option) {
        case 1:
          user.recharge();
          break;
        case 2:
          user.makeCall();
          break;
        case 3:
          user.checkBalance();
          break;
        case 4:
          user.showHistory();
          break;
        case 5:
          print('🔒 Logged out.');
          return;
        default:
          print('❗ Invalid option. Try again.');
      }
    } catch (e) {
      print('⚠️ Error: Please enter a valid number.');
    }
  }
}
