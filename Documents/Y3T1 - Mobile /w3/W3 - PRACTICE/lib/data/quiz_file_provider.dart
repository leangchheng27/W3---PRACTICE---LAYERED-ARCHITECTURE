import 'dart:io';
import 'dart:convert';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  // Q2: Read Quiz from JSON file (including IDs and submissions)
  Quiz readQuiz() {
    final file = File(filePath);
    final content = file.readAsStringSync();
    final data = jsonDecode(content);

    // Read quiz ID
    String? quizId = data['id'];

    // Map JSON questions to domain objects (preserving IDs)
    var questionsJson = data['questions'] as List;
    var questions = questionsJson.map((q) {
      return Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        points: q['points'],
      );
    }).toList();

    // Create the quiz with existing ID
    Quiz quiz = Quiz(id: quizId, questions: questions);

    // Read players/submissions if they exist
    if (data.containsKey('players')) {
      var playersJson = data['players'] as List;
      for (var playerData in playersJson) {
        String userName = playerData['userName'];
        Player player = Player(userName: userName, quiz: quiz);

        // Read player's answers (preserving IDs)
        if (playerData.containsKey('answers')) {
          var answersJson = playerData['answers'] as List;
          for (var answerData in answersJson) {
            Answer answer = Answer(
              id: answerData['id'],
              questionId: answerData['questionId'],
              answerChoice: answerData['answerChoice'],
            );
            player.addAnswer(answer);
          }
        }

        quiz.addPlayer(player);
      }
    }

    return quiz;
  }

  // Q3: Write Quiz to JSON file
  void writeQuiz(Quiz quiz) {
    Map<String, dynamic> data = {
      'id': quiz.id,
      'questions': quiz.questions.map((q) => {
        'id': q.id,
        'title': q.title,
        'choices': q.choices,
        'goodChoice': q.goodChoice,
        'points': q.points,
      }).toList(),
      'players': quiz.players.map((p) => {
        'userName': p.userName,
        'answers': p.answers.map((a) => {
          'id': a.id,
          'questionId': a.questionId,
          'answerChoice': a.answerChoice,
        }).toList(),
      }).toList(),
    };

    final file = File(filePath);
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String jsonString = encoder.convert(data);
    file.writeAsStringSync(jsonString);
  }
}