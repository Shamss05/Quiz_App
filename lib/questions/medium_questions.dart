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
    question: "Q1: What is the value of 7 × 8 - 14?",
    options: ["54", "42", "50", "56"],
    answer: "42",
  ),
  Question(
    question: "Q2: If x = 5, what is 3x² - 2x + 4?",
    options: ["71", "77", "79", "81"],
    answer: "77",
  ),
  Question(
    question: "Q3: What is the area of a triangle with a base of 12 cm and a height of 8 cm?",
    options: ["48 cm²", "96 cm²", "64 cm²", "24 cm²"],
    answer: "48 cm²",
  ),
  Question(
    question: "Q4: What is the sum of the angles in a pentagon?",
    options: ["540°", "360°", "720°", "600°"],
    answer: "540°",
  ),
  Question(
    question: "Q5: Simplify: 5(3 + 2) - 4²",
    options: ["9", "11", "7", "5"],
    answer: "7",
  ),
  Question(
    question: "Q6: If 3a + 2 = 20, what is the value of a?",
    options: ["5", "6", "7", "8"],
    answer: "6",
  ),
  Question(
    question: "Q7: What is the least common multiple (LCM) of 6 and 8?",
    options: ["16", "24", "18", "12"],
    answer: "24",
  ),
  Question(
    question: "Q8: Find the value of 25 ÷ (5 + 5):",
    options: ["5", "2.5", "3", "4"],
    answer: "2.5",
  ),
  Question(
    question: "Q9: Which of the following numbers is a prime number?",
    options: ["15", "21", "29", "33"],
    answer: "29",
  ),
  Question(
    question: "Q10: What is 2x - 3 = 11? Find x:",
    options: ["7", "6", "8", "9"],
    answer: "7",
  ),
];



