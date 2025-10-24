import 'dart:io';

import 'data/quiz_file_provider.dart';
import 'domain/quiz.dart';
import 'ui/quiz_console.dart';

void main() {

  final scriptDir = File.fromUri(Platform.script).parent;
  final projectRoot = scriptDir.parent;
  final path = '${projectRoot.path}/lib/data/quiz_data.json';
  final repo = QuizRepository(path);

  Quiz quiz;
  if (File(path).existsSync()) {
    quiz = repo.readQuiz();
  } else {
    quiz = Quiz(questions: [
      Question(
          title: "Capital of France?",
          choices: ["Paris", "London", "Rome"],
          goodChoice: "Paris",
          points: 10),
      Question(
          title: "2 + 2 = ?",
          choices: ["2", "4", "5"],
          goodChoice: "4",
          points: 50),
    ]);
    repo.writeQuiz(quiz);
  }

  QuizConsole console = QuizConsole(quiz: quiz);

  console.startQuiz();

  repo.writeQuiz(quiz);
}