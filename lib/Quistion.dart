class Quistions {
  String quistionText;
  List<Answer> answerOptions;

  Quistions({
    required this.quistionText,
    required this.answerOptions,
  });
}

class Answer {
  final String answer;
  final bool isCorrect;

  Answer({required this.answer, required this.isCorrect});
}

List<Quistions> getAnswerOptions() {
  return [
    Quistions(
      quistionText: "What is the capital of France?",
      answerOptions: [
        Answer(answer: "Berlin", isCorrect: false),
        Answer(answer: "Madrid", isCorrect: false),
        Answer(answer: "Paris", isCorrect: true),
        Answer(answer: "Lisbon", isCorrect: false),
      ],
    ),
    Quistions(
      quistionText: "Which planet is known as the Red Planet?",
      answerOptions: [
        Answer(answer: "Earth", isCorrect: false),
        Answer(answer: "Mars", isCorrect: true),
        Answer(answer: "Jupiter", isCorrect: false),
        Answer(answer: "Saturn", isCorrect: false),
      ],
    ),
    Quistions(
      quistionText: "Who developed Flutter?",
      answerOptions: [
        Answer(answer: "Apple", isCorrect: false),
        Answer(answer: "Google", isCorrect: true),
        Answer(answer: "Microsoft", isCorrect: false),
        Answer(answer: "Facebook", isCorrect: false),
      ],
    ),
    Quistions(
      quistionText: "Which language is used for mobile development?",
      answerOptions: [
        Answer(answer: "Java", isCorrect: false),
        Answer(answer: "Dart", isCorrect: true),
        Answer(answer: "C++", isCorrect: false),
        Answer(answer: "Kotlin", isCorrect: false),
      ],
    ),
    Quistions(
      quistionText: "What is Flutter?",
      answerOptions: [
        Answer(
            answer: "A framework for building cross-platform apps",
            isCorrect: true),
        Answer(answer: "A mobile app development platform", isCorrect: false),
        Answer(answer: "A version control system", isCorrect: false),
        Answer(answer: "A web framework", isCorrect: false),
      ],
    )
  ];
}
