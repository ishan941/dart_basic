import 'dart:io';
import 'package:main/strings/status_utils.dart';

// class Status {
//   StatusUtils? statusUtils;
//   List<Bank>? data;

//   Status({this.statusUtils, this.data});

//   @override
//   String toString() {
//     return "Status: $statusUtils \nData: $data";
//   }
// }

class Bank {
  int? bankId;
  String? bankName;
  String? branch;
  String? establishedDate;
  String? country;

  Bank(
      {this.bankId,
      this.bankName,
      this.branch,
      this.establishedDate,
      this.country});

  @override
  String toString() {
    return "\nBankId: $bankId\nBankName: $bankName\nBranch: $branch\nEstablished: $establishedDate\nCountry: $country";
  }
}

void main() {
  List<Bank> bankList = [];

  for (int i = 0; i < 4; i++) {
    StatusUtils statusUtils = StatusUtils.loading;
    print(" The state is  $statusUtils");

    try {
      stdout.write("Enter bank name");
      String? bankName = stdin.readLineSync();

      stdout.write("Enter bank Country");
      String? country = stdin.readLineSync();

      if (bankName == null || bankName.isEmpty) {
        throw Exception("Bank name should not be empty");
      }

      Bank bank = Bank(bankId: i + 1, bankName: bankName, country: country);
      bankList.add(bank);
      print("✅ Added bank: ${bank.bankName} (ID: ${bank.bankId})");

      statusUtils = StatusUtils.success;
    } catch (e) {
      statusUtils = StatusUtils.error;
      print("❌ Error: ${e.toString()}");
    }
  }
  print("Total banks entered: ${bankList.length}");

  Map<String, List<Bank>> countryGroups = {};
  for (var bank in bankList) {
    if (bank.country != null) {
      countryGroups.putIfAbsent(bank.country!, () => []).add(bank);
    }
  }

  print("\nBanks grouped by country:");
  countryGroups.forEach((country, banks) {
    print("🇳🇵 $country:");
    banks.forEach((b) => print(" - ${b.bankName}"));
  });
}


// Press Control + Command + Space
// → Opens emoji picker, select and copy.

// 💻 On Windows:
// Press Windows + . (dot)