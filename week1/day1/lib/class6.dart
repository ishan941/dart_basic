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
    return "\nID: $bankId";
  }
}

void main(List<String> args) {
  List<Bank> bankList = [];
  Map<String, List<Bank>> countryGroups = {};
  int bankId = 1;
  StatusUtils statusUtils = StatusUtils.loading;
  print("🫣 Loading....");

  for (int i = 0; i < 5; i++) {
    try {
      bankId += 1;
      stdout.write("Enter bank name");
      String? bankName = stdin.readLineSync();
      stdout.write("Enter bank brach");
      String? bankBranch = stdin.readLineSync();
      stdout.write("Enter bank country");
      String? country = stdin.readLineSync();
      if (bankName == null ||
          bankName.isEmpty ||
          bankBranch == null ||
          bankBranch.isEmpty ||
          country == null ||
          country.isEmpty) {
        statusUtils = StatusUtils.error;
        print(statusUtils);
        print("Invalide Input");
        throw Exception("Error");
      }
      Bank bank = Bank(
          bankId: bankId,
          bankName: bankName,
          branch: bankBranch,
          country: country);

      bankList.add(bank);

      statusUtils = StatusUtils.success;
    } catch (e) {
      statusUtils = StatusUtils.error;
      print("❌Error: ${e.toString()}");
    }
  }

  for (var bank in bankList) {
    if (bank.country != null) {
      countryGroups.putIfAbsent(bank.country!, () => []).add(bank);
    }
  }
  print(statusUtils);
  print("\t$countryGroups\n");
  countryGroups.forEach((country, bank) {
    print("🏠 Group of -> $country bank");
    for (var b in bank) {
      print("${b.bankName}");
    }
  });
}
