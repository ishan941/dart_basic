import 'dart:io';

class Car {
  String? brand;
  String? year;

  Car({this.brand, this.year});

  Map<String, dynamic> toMap() => {
        'brand': brand,
        'year': year,
      };

  factory Car.fromMap(Map<String, dynamic> map) => Car(
        brand: map['brand'],
        year: map['year'],
      );
}

void main() {
  List<Map<String, dynamic>> carList = [];
  for (int i = 1; i <= 5; i++) {
    stdout.write("Enter brand of car $i: ");
    String? brand = stdin.readLineSync();

    stdout.write("Enter year of car $i: ");
    String? year = stdin.readLineSync();

    Car car = Car(brand: brand, year: year);
    carList.add(car.toMap());
  }
  for (var car in carList) {
    print(car['brand']);
  }
}
