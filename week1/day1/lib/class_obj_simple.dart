import 'dart:io';

class Car {
  String? brand;
  String? year;
  Car({this.brand, this.year});
}

void main() {
  List<Car> carList = [];
  for (int i = 1; i <= 5; i++) {
    stdout.write("Enter brand of car $i: ");
    String? brand = stdin.readLineSync();

    stdout.write("Enter year of car $i: ");
    String? year = stdin.readLineSync();

    Car car = Car(brand: brand, year: year);
    carList.add(car);
  }
  for (var car in carList) {
    print("Brand: ${car.brand}, Year: ${car.year}");
  }
}
