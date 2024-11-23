import 'package:flutter/material.dart';
import 'dart:async';
import '../questions/easy_questions.dart';
import 'package:QuizGame/screens/fourth_screen.dart';
import 'package:QuizGame/screens/fifth_screen.dart';

class EasyScreen extends StatefulWidget {
  const EasyScreen({super.key});

  @override
  State<EasyScreen> createState() => _EasyScreenState();
}

class _EasyScreenState extends State<EasyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Screen3(),
      ]),
    );
  }
}

class Screen3 extends StatefulWidget {
  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  int currentQuestionIndex = 0;
  int score = 0;
  int _counter = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _counter = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer?.cancel();
          showTimeUpDialog();
        }
      });
    });
  }

  void restartGame() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      _counter = 30;
      _timer?.cancel();
      startTimer();
    });
  }

  void checkAnswer(String selectedOption) {
    if (selectedOption == questions[currentQuestionIndex].answer) {
      setState(() {
        score++;
      });
    } else {
      setState(() {
          score--;
      });
    }

    setState(() {
      currentQuestionIndex++;
    });

    if (currentQuestionIndex >= questions.length) {
      _timer?.cancel();
      navigateToResult();
    } else {
      showFeedbackDialog(selectedOption);
    }
  }


  void showFeedbackDialog(String selectedOption) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: selectedOption == questions[currentQuestionIndex - 1].answer
            ? const Color(0xff449B92)
            : const Color(0xffe85a4b),
        title: Text(
          selectedOption == questions[currentQuestionIndex - 1].answer
              ? "Correct!"
              : "Incorrect!",
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            child: const Text("Next", style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void showTimeUpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Time's up!"),
        actions: [
          TextButton(
            child: const Text("Restart",style: TextStyle(color: Color(0xff449B92)),),
            onPressed: () {
              Navigator.of(context).pop();
              restartGame();
            },
          ),
        ],
      ),
    );
  }

  void navigateToResult() {
    if (score >= 5) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FourthScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FifthScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 890,
          color: Color(0xFFFDBAF2),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              Center(
                                child: Icon(Icons.arrow_back_ios),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // right timer shape
              Positioned(
                left: 270,
                top: 30,
                child: Container(
                  width: 107,
                  height: 46,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFDBAF2),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                ),
              ),

              // right timer text
              Positioned(
                left: 283,
                top: 42,
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 23,
                      color: Colors.black,
                    ),
                    Text(
                      '   ${_counter}s',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'DynaPuff',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),

              // text question box
              Positioned(
                left: 45,
                top: 153,
                child: SizedBox(
                  width: 284,
                  height: 331,
                  child: Column(
                    children: [
                      Text(
                        questions[currentQuestionIndex].question,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: 'DynaPuff',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ============================= >>>   THE Upper Body    <<<<==========================================

              // white box   (1)
              Positioned(
                left: 21,
                top: 469,
                child: Container(
                  width: 372,
                  height: 244,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.7300000190734863),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                ),
              ),

              // choose correct box    (2)
              Positioned(
                left: 85,
                top: 487,
                child: SizedBox(
                  width: 270,
                  height: 33,
                  child: Text(
                    'Choose The Correct Answer',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'DynaPuff',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),

              //================================================
              // left choice shape
              Positioned(
                left: 38,
                top: 543,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 48, 155, 146)),
                      child: Text(
                        questions[currentQuestionIndex]
                            .options[0], // Display only the first option
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'DynaPuff',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      onPressed: () {
                        checkAnswer(questions[currentQuestionIndex].options[
                        0]); // Call checkAnswer with the first option
                      },
                    ),
                  ],
                ),
              ),

              // left choice answer

              //===========================================================
              //  under left choice
              Positioned(
                left: 38,
                top: 630,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 48, 155, 146)),
                      child: Text(
                        questions[currentQuestionIndex]
                            .options[1], // Display only the first option
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'DynaPuff',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      onPressed: () {
                        checkAnswer(questions[currentQuestionIndex].options[
                        1]); // Call checkAnswer with the first option
                      },
                    ),
                  ],
                ),
              ),

              //===========================================================

              //  right choice
              Positioned(
                left: 220,
                top: 543,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 48, 155, 146)),
                      child: Text(
                        questions[currentQuestionIndex]
                            .options[2], // Display only the first option
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'DynaPuff',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      onPressed: () {
                        checkAnswer(questions[currentQuestionIndex].options[
                        2]); // Call checkAnswer with the first option
                      },
                    ),
                  ],
                ),
              ),

              //==========================================================================

              //  under right choice
              Positioned(
                left: 220,
                top: 630,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 48, 155, 146)),
                      child: Text(
                        questions[currentQuestionIndex]
                            .options[3], // Display only the first option
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'DynaPuff',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      onPressed: () {
                        checkAnswer(questions[currentQuestionIndex].options[
                        3]); // Call checkAnswer with the first option
                      },
                    ),
                  ],
                ),
              ),

              // ==============================================================================

              //submit button shape
              // Positioned(
              //     left: 115,
              //     top: 763,
              //     child: SizedBox(
              //       height: 58,
              //       width: 176,
              //       child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //             backgroundColor:
              //             const Color.fromARGB(255, 68, 155, 146)),
              //         child: const Text(
              //           "Submit",
              //           style: TextStyle(
              //             fontSize: 21,
              //             color: Colors.white,
              //             fontFamily: 'DynaPuff',
              //             fontWeight: FontWeight.w600,
              //             height: 0,
              //           ),
              //         ),
              //         onPressed: () {
              //           starttimer();
              //         },
              //       ),
              //     )),
              // ======================================================================

              // right score shape
              Positioned(
                left: 271,
                top: 99,
                child: Container(
                  width: 107,
                  height: 46,
                  decoration: ShapeDecoration(
                    color: Color(0xFF449B92),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              // right score text
              Positioned(
                left: 282,
                top: 112,
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 23,
                    ),
                    Text(
                      '   ${score} hp',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'DynaPuff',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
