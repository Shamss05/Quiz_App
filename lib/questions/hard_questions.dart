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
    question: "Q1: What is the value of 5! (5 factorial)?",
    options: ["120", "60", "25", "30"],
    answer: "120",
  ),
  Question(
    question: "Q2: Solve for x: 3x + 7 = 2x + 18",
    options: ["10", "11", "9", "12"],
    answer: "11",
  ),
  Question(
    question: "Q3: What is the derivative of x² + 4x + 6?",
    options: ["2x + 4", "2x + 6", "4x + 6", "x² + 4"],
    answer: "2x + 4",
  ),
  Question(
    question: "Q4: What is the value of the limit as x approaches 0: lim(x→0) (sin(x)/x)?",
    options: ["0", "1", "infinity", "undefined"],
    answer: "1",
  ),
  Question(
    question: "Q5: What is the value of √(256)?",
    options: ["16", "15", "18", "14"],
    answer: "16",
  ),
  Question(
    question: "Q6: What is the integral of 2x dx?",
    options: ["x² + C", "x²", "2x²", "2x + C"],
    answer: "x² + C",
  ),
  Question(
    question: "Q7: Solve for y: 2y - 3 = 7y + 12",
    options: ["-3", "3", "-4", "4"],
    answer: "-3",
  ),
  Question(
    question: "Q8: What is the sum of the first 100 prime numbers?",
    options: ["24133", "25000", "21169", "20000"],
    answer: "24133",
  ),
  Question(
    question: "Q9: What is the value of log₁₀(1000)?",
    options: ["3", "2", "4", "5"],
    answer: "3",
  ),
  Question(
    question: "Q10: Solve for x: 2x³ - 4x² + x - 3 = 0",
    options: ["x = 1", "x = 3", "x = -1", "x = 0"],
    answer: "x = 1",
  ),
];



