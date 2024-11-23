import 'package:flutter/material.dart';
import 'package:QuizGame/screens/easy_screen.dart';
import 'package:QuizGame/screens/medium_screen.dart';
import 'package:QuizGame/screens/hard_screen.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8, initialPage: 1);

  final List<Map<String, dynamic>> cardStyles = [
    {
      "color": Color(0xffFDBAF2),
      "text": "Easy",
      "image": "assets/images/rb_2150130070.png",
    },
    {
      "color": Color(0xff449B92),
      "text": "Medium",
      "image": "assets/images/rb_2150130064.png",
    },
    {
      "color": Color(0xffF5CB4E),
      "text": "Hard",
      "image": "assets/images/rb_2150130061.png",
    },
  ];

  int _selectedIndex = 1; // Default to Medium

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        children: [
          SizedBox(height: 40),
          Row(
            children: [
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 18),
                      Center(
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                "Pick a card\nto play quiz",
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'DynaPuff',
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Select the quiz level you want to play",
                style: TextStyle(fontSize: 20, color: Color(0xff808080)),
              ),
            ],
          ),
          Center(
            child: SizedBox(
              height: 500,
              child: PageView.builder(
                controller: _pageController,
                itemCount: cardStyles.length,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index; // Update the selected index based on swipe
                  });
                },
                itemBuilder: (context, index) {
                  final cardStyle = cardStyles[index];

                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = (_pageController.page! - index).abs();
                        value = (1 - (value * 0.2)).clamp(0.8, 1.0);
                      }

                      return Center(
                        child: SizedBox(
                          height: Curves.easeOut.transform(value) * 400,
                          width: Curves.easeOut.transform(value) * 350,
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: cardStyle["color"],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Container(
                                  width: 160,
                                  height: 40,
                                  decoration: BoxDecoration(color: Color(0xffD9D9D9), borderRadius: BorderRadius.circular(100)),
                                  child: Center(
                                    child: Text(
                                      cardStyle["text"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'DynaPuff',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(color: Color(0xffD9D9D9), borderRadius: BorderRadius.circular(100)),
                                  child: Center(
                                    child: Text(
                                      "Level",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'DynaPuff',
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(16),
                              ),
                              child: Image.asset(
                                cardStyle["image"],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 274, // Adjust height if needed
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the appropriate screen based on the selected index
                if (_selectedIndex == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EasyScreen()),
                  );
                } else if (_selectedIndex == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MediumScreen()),
                  );
                } else if (_selectedIndex == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HardScreen()),
                  );
                }
              },
              child: Text("Play Quiz", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontFamily: 'DynaPuff', fontSize: 30)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
