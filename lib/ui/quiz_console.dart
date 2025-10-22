import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    while (true) {
      stdout.write('Your name: ');
      String? nameInput = stdin.readLineSync();

      if (nameInput == null || nameInput.isEmpty) {
        print('--- Quiz Finished ---');

        if (quiz.players.isEmpty) {
          print('No players yet.');
        } else {
          for (var p in quiz.players) {
            int scorePercent = p.getScoreInPercentage();
            print('Player: ${p.userName}\tScore: $scorePercent');
          }
        }
        return;
      }

      // Create a new player
      Player player = Player(userName: nameInput, quiz: quiz);
      
      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.points} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(questionId: question.id, answerChoice: userInput);
          player.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }

      int score = player.getScoreInPercentage();
      int point = player.getScoreInPoint();

      print('--- Quiz Finished ---');
      print('Your score in percentage: $score %');
      print('Your score in point: $point');

      bool found = false;
      for (var p in quiz.players) {
        if (p.userName.toLowerCase() == player.userName.toLowerCase()) {
          p.answers = player.answers; // overwrite
          found = true;
          break;
        }
      }

      if (!found) {
        quiz.addPlayer(player); // add new player
      }
    }
  }
}
