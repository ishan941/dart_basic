import 'dart:io';

class CinemaUser {
  String username;
  String password;
  List<String> bookedTickets;

  CinemaUser({
    required this.username,
    required this.password,
    List<String>? bookedTickets,
  }) : bookedTickets = bookedTickets ?? [];

  void bookTicket(List<String> availableMovies) {
    print("\n🎬 Available Movies:");
    for (int i = 0; i < availableMovies.length; i++) {
      print("${i + 1}. ${availableMovies[i]}");
    }

    stdout.write("Enter movie number to book: ");
    int? choice = int.tryParse(stdin.readLineSync() ?? "");

    if (choice != null && choice >= 1 && choice <= availableMovies.length) {
      String selectedMovie = availableMovies[choice - 1];
      bookedTickets.add(selectedMovie);
      print("✅ Ticket booked for '$selectedMovie'");
    } else {
      print("❌ Invalid selection.");
    }
  }

  void cancelTicket() {
    if (bookedTickets.isEmpty) {
      print("❌ No tickets to cancel.");
      return;
    }

    print("\n🎟️ Your Booked Tickets:");
    for (int i = 0; i < bookedTickets.length; i++) {
      print("${i + 1}. ${bookedTickets[i]}");
    }

    stdout.write("Enter ticket number to cancel: ");
    int? choice = int.tryParse(stdin.readLineSync() ?? "");

    if (choice != null && choice >= 1 && choice <= bookedTickets.length) {
      String removed = bookedTickets.removeAt(choice - 1);
      print("🗑️ Ticket for '$removed' cancelled.");
    } else {
      print("❌ Invalid selection.");
    }
  }

  void viewBookings() {
    if (bookedTickets.isEmpty) {
      print("📭 No tickets booked.");
    } else {
      print("\n🎟️ Your Booked Tickets:");
      for (var ticket in bookedTickets) {
        print("🎬 $ticket");
      }
    }
  }
}

void main() {
  cinemaBookingSystem();
}

void cinemaBookingSystem() {
  Map<String, CinemaUser> users = {};
  List<String> availableMovies = [
    "Avengers: Endgame",
    "Inception",
    "Spider-Man: No Way Home",
    "Interstellar",
    "The Dark Knight"
  ];

  while (true) {
    print("\n==== 🎟️ Main Menu ====");
    print("1️⃣  Register New User");
    print("2️⃣  Login");
    print("3️⃣  Exit");

    stdout.write("Enter your choice: ");
    int? choice = int.tryParse(stdin.readLineSync() ?? "");

    switch (choice) {
      case 1:
        registerUser(users);
        break;
      case 2:
        loginUser(users, availableMovies);
        break;
      case 3:
        print("🙏 Thank you for using the Cinema Ticket Booking System!");
        return;
      default:
        print("❌ Invalid choice. Please try again.");
    }
  }
}

void registerUser(Map<String, CinemaUser> users) {
  print("\n=== 📝 Register New User ===");

  stdout.write("Enter username: ");
  String? username = stdin.readLineSync();

  stdout.write("Enter password: ");
  String? password = stdin.readLineSync();

  if (username == null ||
      password == null ||
      username.isEmpty ||
      password.isEmpty) {
    print("❌ Username and password cannot be empty.");
    return;
  }

  if (users.containsKey(username)) {
    print("❌ Username already exists.");
    return;
  }

  users[username] = CinemaUser(username: username, password: password);
  print("🎉 User '$username' registered successfully!");
}

void loginUser(Map<String, CinemaUser> users, List<String> availableMovies) {
  print("\n=== 🔐 Login ===");

  stdout.write("Enter username: ");
  String? username = stdin.readLineSync();

  stdout.write("Enter password: ");
  String? password = stdin.readLineSync();

  if (username == null || password == null) {
    print("❌ Please enter valid credentials.");
    return;
  }

  if (!users.containsKey(username)) {
    print("❌ Username not found.");
    return;
  }

  CinemaUser user = users[username]!;

  if (user.password != password) {
    print("❌ Incorrect password.");
    return;
  }

  print("✅ Login successful! Welcome, $username!");

  while (true) {
    print("\n==== 🎬 Cinema Menu ====");
    print("1️⃣  View Movies");
    print("2️⃣  Book Ticket");
    print("3️⃣  Cancel Ticket");
    print("4️⃣  View My Bookings");
    print("5️⃣  Logout");

    stdout.write("Enter your choice: ");
    int? choice = int.tryParse(stdin.readLineSync() ?? "");

    switch (choice) {
      case 1:
        print("\n📺 Available Movies:");
        for (int i = 0; i < availableMovies.length; i++) {
          print("${i + 1}. ${availableMovies[i]}");
        }
        break;
      case 2:
        user.bookTicket(availableMovies);
        break;
      case 3:
        user.cancelTicket();
        break;
      case 4:
        user.viewBookings();
        break;
      case 5:
        print("👋 Logged out.");
        return;
      default:
        print("❌ Invalid choice. Try again.");
    }
  }
}
