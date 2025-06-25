import 'dart:io';

class LibraryUser1 {
  String? username;
  String? password;
  List<String> borrowedBooks;
  LibraryUser1({this.username, this.password, List<String>? borrowedBooks})
      : borrowedBooks = borrowedBooks ?? [];
      //
      //
      void borrowBook(List<String> availableBooks){
        if(availableBooks.isEmpty){
          print("Emplty");
          return;
        }
        print("Available books");
        for(int i =0 ; i < availableBooks.length; i++){
          print("${i+1}. ${availableBooks[i]}");
        }
        stdout.write("Enter the number of the nook to borrow");
        int? choose = int.parse(stdin.readLineSync()!);
        
      }
}

void main() {
  librrySystem();
}

librrySystem() {
  Map<String, LibraryUser1> users = {};
  List<String> availableBooks = [
    "1984",
    "To Kill a Mockingbird",
    "The Great Gatsby",
    "The Catcher in the Rye",
    "Moby-Dick"
  ];
  while (true) {
    print("\n==== Main Menu ====");
    print("1. Register New User");
    print("2. Login");
    print("3. Exit");
    stdout.write("Enter choice: ");
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        registerUser(users);
        break;
      case '2':
        loginUser(users, availableBooks);
        break;
      case '3':
        print("👋 Exiting... Goodbye!");
        return;
      default:
        print("❌ Invalid choice. Try again.");
    }
  }
}

registerUser(Map<String, LibraryUser1> users) {
  stdout.write("Enter username: ");
  String username = stdin.readLineSync()!;
  stdout.write("Enter password: ");
  String password = stdin.readLineSync()!;
  if (password.isEmpty) {
    print("Password should not be null");
    return;
  }
  if (users.containsKey(username)) {
    print("User already Created");
    return;
  }
  users[username] = LibraryUser1(username: username, password: password);
  print("Successfully created");
}

loginUser(Map<String, LibraryUser1> users, List<String> availableBooks) {
  stdout.write("Enter username: ");
  String username = stdin.readLineSync()!;
  stdout.write("Enter password: ");
  String password = stdin.readLineSync()!;

  if (!users.containsKey(username)) {
    print("Invalid");
    return;
  }
  if (users[username]!.password != password) {
    print("Password not correct");
    return;
  }
  print("login successfull");
  homePage(users[username]!, availableBooks);
}

homePage(LibraryUser1 user, List<String> availableBooks) {
  while (true) {
    print("\n==== Library Menu ====");
    print("1. View Available Books");
    print("2. Borrow Book");
    print("3. Return Book");
    print("4. View My Borrowed Books");
    print("5. Logout");
    stdout.write("Enter choice: ");
    String? input = stdin.readLineSync();
     switch (input) {
      case '1':
        print("\n📚 Available Books:");
        if (availableBooks.isEmpty) {
          print("📭 No books available.");
        } else {
          for (String book in availableBooks) {
            print("- $book");
          }
        }
        break;
      case '2':
        user.borrowBook(availableBooks);
        break;
      case '3':
        user.returnBook(availableBooks);
        break;
      case '4':
        user.viewBorrowedBooks();
        break;
      case '5':
        print("👋 Logged out successfully.");
        return;
      default:
        print(}
  }
}
