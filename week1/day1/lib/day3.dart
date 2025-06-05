day3() {
  int a = 20;
  int b = 10;
  int c = 0;

  //compare value
  if (a < b) {
    print("a is less than b");
  } else if (a > b) {
    print("b is less tha a");
  } else {
    print("a and b is equal");
  }

  //OR
  if (a < b || a > b) {
    print("A and b is not equal");
  } else {
    print("Equal");
  }

  // And
  if (a < b && a > b) {
    print("A and b is not equal");
  } else {
    print("Equal");
  }
  if (c < b && a > b) {
    print("A and b is not equal");
  } else {
    print("Equal");
  }

  // Switch case
  switch (a) {
    case 10:
      print("The nunmber is 10");
    case 20:
      print("The number is 20");
    default:
      print("Inavlid");
  }
}
