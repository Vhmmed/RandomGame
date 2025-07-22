import 'dart:io';
import 'dart:math';

void main() {
  print("\n===============================");
  print("       Welcome To The Game     ");
  print("===============================");

  stdout.write("Enter The Min Number: ");
  int min = int.parse(stdin.readLineSync()!);

  stdout.write("Enter The Max Number: ");
  int max = int.parse(stdin.readLineSync()!);

  int randomBetween(int min, int max) {
    Random random = Random();
    return min + random.nextInt(max - min + 1);
  }

  int level = 1;
  while (level <= 4) {
    print("\n===============================");
    print("         LEVEL $level         ");
    print("===============================");

    List<String> correctAnswers = [];
    List<String> wrongAnswers = [];

    int attempts = 0;
    while (attempts < 3) {
      int a = randomBetween(min, max);
      int b = randomBetween(min, max);
      int correctAnswer = 0;
      String operator = "";

      if (level == 1) {
        correctAnswer = a + b;
        operator = "+";
      } else if (level == 2) {
        correctAnswer = a * b;
        operator = "*";
      } else if (level == 3) {
        correctAnswer = a - b;
        operator = "-";
      } else if (level == 4) {
        while (b == 0 || a % b != 0) {
          a = randomBetween(min, max);
          b = randomBetween(min, max);
        }
        correctAnswer = a ~/ b;
        operator = "/";
      }

      String question = "$a $operator $b";
      print("What is $question ?");
      stdout.write("Your answer: ");
      int userAnswer = int.parse(stdin.readLineSync()!);

      if (userAnswer == correctAnswer) {
        print("Correct!");
        correctAnswers.add(question);
      } else {
        print("Wrong! Correct answer is $correctAnswer");
        wrongAnswers.add("$question = $correctAnswer");
      }

      attempts++;
    }

    int total = correctAnswers.length + wrongAnswers.length;
    double percentage = (correctAnswers.length / total) * 100;

    print("\nSummary of Level $level");
    print("Correct: ${correctAnswers.length}");
    print("Wrong: ${wrongAnswers.length}");
    print("Score: ${percentage.toStringAsFixed(2)}%");

    print("\nDo you want to continue to next level? (yes / retry / exit)");
    String? decision = stdin.readLineSync();

    if (decision == "yes") {
      level++;
    } else if (decision == "retry") {
      continue;
    } else {
      print("\nThanks for playing!");
      break;
    }
  }

  if (level > 4) {
    print("\n===============================");
    print("       CONGRATULATIONS!        ");
    print("     You finished the game     ");
    print("===============================");
  }
}
