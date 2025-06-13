import 'dart:io';

import 'package:main/strings/status_utils.dart';

class Status {
  StatusUtils? statusUtils;
  Car? data;
  Status({this.data, this.statusUtils});
  @override
  String toString() {
    return "data: {$data: }\nstatus: $statusUtils,";
  }
}

class Car {
  String? brand;
  String? year;
  Brand? brandDetails;
  Car({this.brand, this.year, this.brandDetails});

  @override
  String toString() {
    return "{brand: $brand,\nyear: $year,\nBrandetails: $brandDetails}";
  }
}

class Brand {
  int? brandId;
  String? brnadCountry;
  Brand({this.brandId, this.brnadCountry});

  @override
  String toString() {
    return "{brandId: $brandId,\nbrandCountry: $brnadCountry}";
  }
}

void main() {
  List<Status> carList = [];

  int brandId = 0;
  for (int i = 1; i <= 3; i++) {
    print("Processing car $i....");
    StatusUtils statusUtils = StatusUtils.loading;

    try {
      stdout.write("Enter brand of car $i: ");
      String? brand = stdin.readLineSync();
      if (brand == null || brand.isEmpty) {
        throw Exception("Brand cannot be empty");
      }

      stdout.write("Enter year of car: ");
      String? year = stdin.readLineSync();
      int.parse(year!);

      brandId += 1;

      stdout.write("Brand Country: ");
      String? brandCountry = stdin.readLineSync();
      Car car = Car(
          brand: brand,
          year: year,
          brandDetails: Brand(brandId: brandId, brnadCountry: brandCountry));
      statusUtils = StatusUtils.success;
      carList.add(Status(data: car, statusUtils: statusUtils));
    } catch (e) {
      statusUtils = StatusUtils.error;
      carList.add(Status(statusUtils: statusUtils));
    }
  }
  for (var car in carList) {
    if (StatusUtils.success == car.statusUtils) {
      print("================================================\n");
      print(car);
      print("================================================\n\n\n");
    }
  }
}
