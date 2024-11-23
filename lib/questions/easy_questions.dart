class Question {
  final String question;
  final List<String> options;
  final String answer;

  Question({
    required this.question,
    required this.options,
    required this.answer,
  });
}

final List<Question> questions = [
  Question(
    question:
        "Q1: Whole numbers ending in 0,2,4,6 and 8 are called ________ numbers.",
    options: ["even", "prime", "composite", "odd"],
    answer: "even",
  ),
  Question(
    question: "Q2: 542 is divisible by ________.",
    options: ["2", "10", "5", "4"],
    answer: "2",
  ),
  Question(
    question: "Q3: A whole number ending in 5 is divisible by ________.",
    options: ["2", "6", "5", "10"],
    answer: "5",
  ),
  Question(
    question: "Q4: What is                               \n16 ÷ 4?",
    options: ["2", "3", "4", "5"],
    answer: "4",
  ),
  Question(
    question: "Q5: Whole numbers ending in 0,2,4,6, and 8 are divisible by ______.",
    options: ["2", "5", "6", "10"],
    answer: "2",
  ),
  Question(
    question: "Q6: 16 and 30 are both divisible by",
    options: ["2", "5", "10", "2, 5, 10"],
    answer: "2",
  ),
  Question(
    question: "Q7: 725 can be divided by _____.",
    options: ["2", "5", "10", "2, 5, 10"],
    answer: "5",
  ),
  Question(
    question: "Q8: Which of the following is divisible by both 5 and 10?",
    options: ["25", "75", "125", "200"],
    answer: "200",
  ),
  Question(
    question: "Q9: What is                               \n8 + 6?",
    options: ["12", "13", "14", "15"],
    answer: "14",
  ),
  Question(
    question: "Q10: ______ is divisible by both 2 and 5.",
    options: ["25", "40", "52", "75"],
    answer: "40",
  ),
];


