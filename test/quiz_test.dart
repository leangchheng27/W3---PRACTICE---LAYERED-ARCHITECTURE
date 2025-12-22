import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  //Both correct
  test('My first test', () {
    Question q1 = Question(
        title: "4-2", choices: ["1", "2", "3"], goodChoice: "2", points: 10);
    Question q2 = Question(
        title: "4+2", choices: ["1", "2", "3"], goodChoice: "6", points: 50);

    Quiz quiz = Quiz(questions: [q1, q2]);

    // Create a player and add answers
    Player player = Player(userName: "Tester", quiz: quiz);
    player.addAnswer(Answer(questionId: q1.id, answerChoice: "2"));
    player.addAnswer(Answer(questionId: q2.id, answerChoice: "6"));

    // Answer are all good
    quiz.addPlayer(player);

    // SCore eis 100
    expect(player.getScoreInPercentage(), equals(100));
    expect(player.getScoreInPoint(), equals(60));
  });

  //Q1 correct
  test('My second test', () {
    Question q1 = Question(
        title: "4-2", choices: ["1", "2", "3"], goodChoice: "2", points: 10);
    Question q2 = Question(
        title: "4+2", choices: ["1", "2", "3"], goodChoice: "6", points: 50);

    Quiz quiz = Quiz(questions: [q1, q2]);

    // Create player
    Player player = Player(userName: "Tester", quiz: quiz);
    player.addAnswer(Answer(questionId: q1.id, answerChoice: "2"));
    player.addAnswer(Answer(questionId: q2.id, answerChoice: "5"));

    // Add player to quiz
    quiz.addPlayer(player);

    // Check player score
    expect(player.getScoreInPercentage(), equals(50));
    expect(player.getScoreInPoint(), equals(10));
  });

  //Q2 correct
  test('My third test', () {
    Question q1 = Question(
        title: "4-2", choices: ["1", "2", "3"], goodChoice: "2", points: 10);
    Question q2 = Question(
        title: "4+2", choices: ["1", "2", "3"], goodChoice: "6", points: 50);

    Quiz quiz = Quiz(questions: [q1, q2]);

    Player player = Player(userName: "Tester", quiz: quiz);
    player.addAnswer(Answer(questionId: q1.id, answerChoice: "3"));
    player.addAnswer(Answer(questionId: q2.id, answerChoice: "6"));

    quiz.addPlayer(player);

    expect(player.getScoreInPercentage(), equals(50));
    expect(player.getScoreInPoint(), equals(50));
  });

  //Both wrong
  test('My fourth test', () {
    Question q1 = Question(
        title: "4-2", choices: ["1", "2", "3"], goodChoice: "2", points: 10);
    Question q2 = Question(
        title: "4+2", choices: ["1", "2", "3"], goodChoice: "6", points: 50);

    Quiz quiz = Quiz(questions: [q1, q2]);

    Player player = Player(userName: "Tester", quiz: quiz);
    player.addAnswer(Answer(questionId: q1.id, answerChoice: "1"));
    player.addAnswer(Answer(questionId: q2.id, answerChoice: "1"));

    quiz.addPlayer(player);

    expect(player.getScoreInPercentage(), equals(0));
    expect(player.getScoreInPoint(), equals(0));
  });
}
