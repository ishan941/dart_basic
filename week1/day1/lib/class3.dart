import 'dart:io';

import 'package:main/strings/status_utils.dart';

// class Status {
//   StatusUtils? statusUtils;
//   List<College>? data;
//   Status({this.data, this.statusUtils});
// }

class College {
  int? cId;
  String? faculty;
  String? noOfStudents;
  String? address;
  College({this.cId, this.faculty, this.address, this.noOfStudents});
}

void main() {
  List<College> collegeList = [];
  int cId = 0;

  for (int i = 0; i < 3; i++) {
    StatusUtils statusUtils = StatusUtils.loading;
    print("Processing...");

    try {
      String? facultyName = stdin.readLineSync();
      int? noOfStudent = int.parse(stdin.readLineSync()!);

      if (facultyName!.isEmpty) {
        throw Exception("faculty name should not be empty");
      }
      cId += 1;

      College college = College(cId: cId, faculty: facultyName);
      collegeList.add(college);

      statusUtils = StatusUtils.success;
    } catch (e) {
      statusUtils = StatusUtils.error;
    }
  }

  print(collegeList.length);
  Map<String, List<College>> collegeGroup = {};

  for (var college in collegeList) {
    if (college.faculty != null) {
      collegeGroup.putIfAbsent(college.faculty!, () => []).add(college);
    }
  }
  collegeGroup.forEach((faculty, college) {
    print("$college");
    college.forEach((c) => print(c.faculty));
  });
}
