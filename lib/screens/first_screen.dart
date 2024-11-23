import 'package:flutter/material.dart';
import 'package:QuizGame/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              width: 600,
              height: 890,
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                      left: 55,
                      top: 750,
                      child: SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Text(
                              "Let's Start",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'DynaPuff',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (second) => SecondScreen()));
                          },
                        ),
                      )),
                  Positioned(
                    left: 0,
                    top: 50,
                    child: SizedBox(
                      width: 393,
                      height: 250,
                      child: Text(
                        'MATH \nQUIZ',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 100,
                          fontFamily: 'DynaPuff',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      top: 280,
                      child: SizedBox(
                          width: 393,
                          height: 250,
                          child: Image.asset(
                              'assets/images/Screenshot 2024-10-30 203147.png'))),
                  Positioned(
                      left: 0,
                      top: 488,
                      child: SizedBox(
                          width: 393,
                          height: 250,
                          child: Image.asset(
                              'assets/images/Screenshot 2024-10-30 215422.png'))),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
