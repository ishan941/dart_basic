import 'dart:js_interop';

class Name {
  static int a = 20;
  static const b = 90;

  static vavr() {
    a = 30;
  }

  jhos() {}
}

vara() {
  Name name = Name();
  Name.b;
  Name.a;
  name.jhos();
}

class Student {
  String? name;
  int? age;
  Student(this.name, this.age);
}
