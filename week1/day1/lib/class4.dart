import 'dart:io';
import 'package:main/strings/status_utils.dart';

class Bank {
  int? bankId;
  String? bankName;
  String? branch;
  String? country;
  Bank({this.bankId, this.bankName, this.branch, this.country});

  @override
  String toString() {
    return "\nBankId: $bankId\nBankName: $bankName\nBranch: $branch\nCountry: $country";
  }
}

void main() {
  List<Bank> bankList = [];
  Map<String, List<Bank>> countryGroups = {};

  int bankId = 1;
  print("Loading.....");
  StatusUtils statusUtils = StatusUtils.loading;

  for (int i = 1; i < 5; i++) {
    try {
      bankId += 1;
      stdout.write("Enter bank name");
      String? bankName = stdin.readLineSync();
      stdout.write("Enter bank brach");
      String? bankBranch = stdin.readLineSync();
      stdout.write("Enter bank country");
      String? country = stdin.readLineSync();

      if (bankName == null || bankName.isEmpty) {
        throw Exception("Bank name should not be empty");
      }
      Bank bank = Bank(
          bankId: bankId,
          bankName: bankName,
          branch: bankBranch,
          country: country);
      bankList.add(bank);
      print("✅ Added bank : ${bank.bankName}");
      statusUtils = StatusUtils.success;
    } catch (e) {
      statusUtils = StatusUtils.error;
      print("❌ Error: ${e.toString()}");
    }
  }
  print("The length of the listed ${bankList.length}");

  for (var bank in bankList) {
    if (bank.country != null) {
      countryGroups.putIfAbsent(bank.country!, () => []).add(bank);
    }
  }

  print("bank Group by countyr");
  countryGroups.forEach((country, banks) {
    print("💌 $country");
    banks.forEach((bank) => print(" - ${bank.bankName}"));
  });
}
