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
    return 'id: $bankId';
  }
}

void main() {
  List<Bank> bankList = [];
  Map<String, List<Bank>> countryGroups = {};
  StatusUtils statusUtils = StatusUtils.loading;
  int bankId = 0;
  for (int i = 0; i < 5; i++) {
    try {
      bankId += 1;
      stdout.write("Please Enter bank Name: ");
      String? bankName = stdin.readLineSync();
      stdout.write("Please Enter Branch Name: ");
      String? branch = stdin.readLineSync();
      stdout.write("Please Enter Country Name: ");
      String? country = stdin.readLineSync();
      if (bankName == null ||
          bankName.isEmpty ||
          branch == null ||
          branch.isEmpty ||
          country == null ||
          country.isEmpty) {
        print("Invalid input. Skipping entry.");
        statusUtils = StatusUtils.error;
        continue;
      }

      Bank bank = Bank(
          bankId: bankId, bankName: bankName, branch: branch, country: country);
      bankList.add(bank);
      statusUtils = StatusUtils.success;
    } catch (e) {
      statusUtils = StatusUtils.error;
    }
  }
  for (var bank in bankList) {
    if (bank.country != null) {
      countryGroups.putIfAbsent(bank.country ?? "Not", () => []).add(bank);
    }
  }
  print("$countryGroups\n");

  countryGroups.forEach((country, banks) {
    print("\nCountry: $country");
    for (var bank in banks) {
      print(" - ${bank.bankName} -  ${bank.branch}");
    }
  });
}
