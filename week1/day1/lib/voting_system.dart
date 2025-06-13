import 'dart:io';

void main() {
  votingSytem();
}

isab() {
  print("Hello");
}

votingSytem() {
  //
  Map<String, int> voteCounts = {
    'A': 0,
    'B': 0,
    'C': 0,
  };
  // First ma chai a b ra c ko vote 0 rakhdeko

  const int eligibleAge = 18;
  bool a = true;

  // while loop ma first ma true lagauxau repeat garna ko lagi if yes .
  while (a) {
    stdout.write("👤 Enter your name: ");
    String name = stdin.readLineSync()!;

    stdout.write("🎂 Enter your age: ");
    int age = int.parse(stdin.readLineSync()!);

    if (age < eligibleAge) {
      print("❌ Sorry $name, you're not eligible to vote.");
    } else {
      print("🗳️ Candidates: A, B, C");
      stdout.write("👉 Enter the name of the candidate you want to vote for: ");
      String vote = stdin.readLineSync()!;

      switch (vote) {
        case 'A':
        case 'B':
        case 'C':
          //case a b c, j enter garxa hamlay mathi banako key ko value 1 lay increase hunxa .
          //voteCounts => variable of map
          //[vote] => user choose for vote a, b or c

          voteCounts[vote] = voteCounts[vote]! + 1;
          // [vote] => [key]
          // voteCounts ma gayara, enter gareko key khojxa firstma
          // key ma vako value 1 lay increase gardenxa .
          print("✅ Thank you $name, your vote for $vote has been counted!");
          break;
        default:
          print("⚠️ Invalid candidate. Vote not counted.");
      }
    }

    stdout.write("\nDo you want to continue voting? (y/n): ");
    String again = stdin.readLineSync()!.toLowerCase();
    if (again == 'y' || again == 'yes') {
      //y lekhyo vane while loop feri continue hunxa
      a = true;
    } else if (again == 'n' || again == 'no') {
      //n lekhyo vane while loop  terminate hunxa
      a = false;
    }
  }

  print("\n📊 Voting Results:");
  voteCounts.forEach((candidate, count) {
    //candidate ==> key "A,b c"
    // count ==> value
    //ka kas ko kati kati vote aayo vanera 1 by 1 candidatera count ma set garxa
    print("🔹 $candidate: $count vote(s)");
  });

  String winner =
      voteCounts.entries.reduce((x, y) => x.value > y.value ? x : y).key;
  // voteCounts.entries ==> sab lai aautai line ma lera aauxa a,b,c lai check garna ko lage
  // reduce((a, b) first ma a ra b ko value compare garxa
  // lest a = 1, b = 4, c = 8
  //.first
  // x = a, y = b,
  // yeslay b select garxa a lai reduce garxa
  // x = b , y = c
  // yeslay c select garxa b lai reduce garxa
  // so yo end hunxa aani last ma select vako value winner ma save hunxa .

  print("\n🏆 The winner is: $winner 🎉");
}

// Step 1: Find the max vote count
//   int maxVotes = voteCounts.values.reduce((a, b) => a > b ? a : b);

// // Step 2: Find all candidates with maxVotes
//   List<String> winners = voteCounts.entries
//       .where((entry) => entry.value == maxVotes)
//       .map((entry) => entry.key)
//       .toList();

// // Step 3: Print the result
//   if (winners.length == 1) {
//     print("\n🏆 The winner is: ${winners.first} 🎉");
//   } else {
//     print(
//         "\n🤝 It's a tie between: ${winners.join(', ')} with $maxVotes vote(s) each!");
//   }
// }
