import 'dart:io';

class LibraryUser {
  String username;
  String password;
  List<String> borrowedBooks;

  LibraryUser({
    required this.username,
    required this.password,
    List<String>? borrowedBooks,
  }) : borrowedBooks = borrowedBooks ?? [];

  void borrowBook(List<String> availableBooks) {
    if (availableBooks.isEmpty) {
      print("❌ No books available to borrow.");
      return;
    }

    print("\n📚 Available Books:");
    for (int i = 0; i < availableBooks.length; i++) {
      print("${i + 1}. ${availableBooks[i]}");
    }

    stdout.write("Enter the number of the book to borrow: ");
    int? choice = int.tryParse(stdin.readLineSync()!);

    if (choice == null || choice < 1 || choice > availableBooks.length) {
      print("❌ Invalid selection.");
      return;
    }

    String selectedBook = availableBooks[choice - 1];
    borrowedBooks.add(selectedBook);
    availableBooks.removeAt(choice - 1);

    print("✅ You borrowed: $selectedBook");
  }

  void returnBook(List<String> availableBooks) {
    if (borrowedBooks.isEmpty) {
      print("⚠️ You have no borrowed books.");
      return;
    }

    print("\n📦 Your Borrowed Books:");
    for (int i = 0; i < borrowedBooks.length; i++) {
      print("${i + 1}. ${borrowedBooks[i]}");
    }

    stdout.write("Enter the number of the book to return: ");
    int? choice = int.tryParse(stdin.readLineSync()!);

    if (choice == null || choice < 1 || choice > borrowedBooks.length) {
      print("❌ Invalid selection.");
      return;
    }

    String returningBook = borrowedBooks[choice - 1];
    availableBooks.add(returningBook);

    print("✅ Returned: $returningBook");
  }

  void viewBorrowedBooks() {
    if (borrowedBooks.isEmpty) {
      print("📭 You have not borrowed any books.");
      return;
    }

    print("\n📘 Your Borrowed Books:");
    for (String book in borrowedBooks) {
      print("- $book");
    }
  }
}

void main() {
  librarySystem();
}

void librarySystem() {
  Map<String, LibraryUser> users = {};
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

void registerUser(Map<String, LibraryUser> users) {
  stdout.write("Enter username: ");
  String username = stdin.readLineSync()!;
  stdout.write("Enter password: ");
  String password = stdin.readLineSync()!;

  if (users.containsKey(username)) {
    print("⚠️ Username already exists.");
    return;
  }

  users[username] = LibraryUser(username: username, password: password);
  print("🎉 User Registered Successfully!");
}

void loginUser(Map<String, LibraryUser> users, List<String> availableBooks) {
  stdout.write("Enter username: ");
  String username = stdin.readLineSync()!;
  stdout.write("Enter password: ");
  String password = stdin.readLineSync()!;

  if (users.containsKey(username) && users[username]!.password == password) {
    print("✅ Login Successful!");
    homePage(users[username]!, availableBooks);
  } else {
    print("❌ Invalid Username or Password.");
  }
}

void homePage(LibraryUser user, List<String> availableBooks) {
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
        print("❌ Invalid choice.");
    }
  }
}
