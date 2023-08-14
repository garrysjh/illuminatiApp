
class QuestionModel{
  final String answer;
  final List<String> options;
  final bool hasAnswered;
  String userAnswer;

  QuestionModel({
    required this.answer, 
    required this.options, 
    this.hasAnswered = false, 
    this.userAnswer = "",
  });

  bool isCorrect(String answer) => this.answer == answer;
}

List<QuestionModel> sampleQuestions = [
  QuestionModel(
    answer: "2",
    options: [
      "1",
      "2",
      "3",
      "4",
    ],
  ),

  QuestionModel(
    answer: "2",
    options: [
      "1",
      "2",
      "3",
      "4",
    ],
  ),

  QuestionModel(
    answer: "2",
    options: [
      "1",
      "2",
      "3",
      "4",
    ],
  ),

  QuestionModel(
    answer: "2",
    options: [
      "1",
      "2",
      "3",
      "4",
    ],
  ),

  QuestionModel(
    answer: "2",
    options: [
      "1",
      "2",
      "3",
      "4",
    ],
  ),

  QuestionModel(
    answer: "2",
    options: [
      "1",
      "2",
      "3",
      "4",
    ],
  ),
];
