class Animal {
  String? name;
  void breath() {
    print("Breathing...");
  }
}

class Dog extends Animal {
  void bark() {
    print("Barking...");
  }
}

void main() {
  Dog d = Dog();
  d.name = "Ishan";
  d.breath();
  d.bark();
  print(d.name);
}
