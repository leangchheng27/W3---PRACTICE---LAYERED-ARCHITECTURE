import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;

  Question({
    String? id, // Add optional parameter
    required this.title,
    required this.choices,
    required this.goodChoice,
    required this.points,
  }) : id = id ?? uuid.v4(); // Use provided ID or generate new
}

class Answer {
  final String id;
  final String questionId;
  final String answerChoice;

  Answer(
      {String? id, // Add optional parameter
      required this.questionId,
      required this.answerChoice})
      : id = id ?? uuid.v4(); // Use provided ID or generate new

  bool isGood(Question question) {
    return this.answerChoice == question.goodChoice;
  }
}

class Player {
  String userName;
  List<Answer> answers = [];
  Quiz quiz;

  Player({required this.userName, required this.quiz});

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  int getScoreInPercentage() {
    int totalScore = 0;
    for (Answer answer in answers) {
      Question? question = quiz.getQuestionById(answer.questionId);
      if (question != null && answer.isGood(question)) {
        totalScore++;
      }
    }
    return ((totalScore / quiz.questions.length) * 100).toInt();
  }

  int getScoreInPoint() {
    int totalScore = 0;
    for (Answer answer in answers) {
      Question? question = quiz.getQuestionById(answer.questionId);
      if (question != null && answer.isGood(question)) {
        totalScore += question.points;
      }
    }
    return totalScore;
  }
}

class Quiz {
  final String id;
  List<Question> questions;
  List<Player> players = [];

  Quiz(
      {String? id, // Add optional parameter
      required this.questions})
      : id = id ?? uuid.v4(); // Use provided ID or generate new

  void addPlayer(Player player) {
    players.add(player);
  }

  Question? getQuestionById(String questionId) {
    for (var question in questions) {
      if (question.id == questionId) {
        return question;
      }
    }
    return null; // Not found
  }

  Answer? getAnswerById(String answerId) {
    for (var player in players) {
      for (var answer in player.answers) {
        if (answer.id == answerId) {
          return answer;
        }
      }
    }
    return null; // Not found
  }
}
