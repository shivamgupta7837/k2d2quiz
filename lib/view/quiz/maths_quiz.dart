import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/fonts.dart';
import 'package:quiz/view/navigation/home.dart';

class MathsQuiz extends StatefulWidget {
  MathsQuiz({super.key});

  @override
  State<MathsQuiz> createState() => _MathsQuizState();
}

class _MathsQuizState extends State<MathsQuiz> {
  int _index = 0;

  final List<Map<String, dynamic>> _quizQuestions = [
  {'question': 'What is the square root of 144?', 'options': ['10', '12', '14', '16'], 'answer': '12'},
  {'question': 'Simplify: 2(x + 3) - 4x', 'options': ['-2x + 6', '2x - 6', '6x + 6', '6x - 6'], 'answer': '-2x + 6'},
  {'question': 'Solve for x: 3x + 5 = 14', 'options': ['1', '2', '3', '4'], 'answer': '3'},
  {'question': 'What is the value of π (pi) to two decimal places?', 'options': ['3.14', '3.15', '3.16', '3.17'], 'answer': '3.14'},
  {'question': 'Find the area of a triangle with base 6 cm and height 8 cm.', 'options': ['24 cm²', '36 cm²', '48 cm²', '64 cm²'], 'answer': '24 cm²'},
  {'question': 'What is the formula for the volume of a sphere?', 'options': ['4/3πr³', '2/3πr³', 'πr³', '2πr²'], 'answer': '4/3πr³'},
  {'question': 'If a number is increased by 20% and then decreased by 20%, the net change is:', 'options': ['4% increase', '4% decrease', '0%', '2% decrease'], 'answer': '4% decrease'},
  {'question': 'The sum of the interior angles of a quadrilateral is:', 'options': ['180°', '360°', '540°', '720°'], 'answer': '360°'},
  {'question': 'The ratio of the circumference of a circle to its diameter is:', 'options': ['π', '2π', 'π/2', 'π²'], 'answer': 'π'},
  {'question': 'If a:b = 2:3 and b:c = 4:5, then a:c is:', 'options': ['8:15', '15:8', '6:5', '5:6'], 'answer': '8:15'}
];

  int _seconds = 10;

  Timer? _timer;
  int _score = 0;

  int clickedButtonIndex = -1;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  bool isDialogBoxOpen = false;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
         isDialogBoxOpen==false?  _timesUp("Time's Up! \n Your Score is:"):null;
          _timer?.cancel();
        }
      });
    });
  }

  Future<dynamic> _timesUp(String title) {
    return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: MyFonts.subHeading(
                  data: title,
                  color: buttonColor,
                  size: 20),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFonts.bodyFont(
                      data: '$_score', color: buttonColor, size: 45),
                      SizedBox(width: 10,),
                  MyFonts.bodyFont(
                      data: 'Points', color: buttonColor, size: 30),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: MyFonts.subHeading(data: 'OK'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false,
                    );
                  },
                ),
              ],
            );
          },
        );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 28,
            )),
        backgroundColor: scaffoldBackgroundColor,
        title: Column(
          children: [
            MyFonts.subHeading(data: "MAthametics Quiz", color: blackColor),
            MyFonts.bodyFont(data: "10 Questions", color: blackColor, size: 12),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: buttonColor,
              child: MyFonts.subHeading(data: "${_seconds}", color: whiteBg),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: whiteBg, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyFonts.subHeading(
                          data: "Question ${_index + 1}",
                          color: blackColor,
                          fontweight: FontWeight.w400,
                          size: 15),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: MyFonts.heading(
                            data: "10 Points",
                            color: blackColor,
                            fontweight: FontWeight.w600,
                            size: 10),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyFonts.subHeading(
                    data: _quizQuestions[_index]['question'],
                    color: buttonColor,
                    fontweight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                        itemCount: _quizQuestions[_index]['options'].length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (_quizQuestions[_index]['options'][index] ==
                                  _quizQuestions[_index]['answer']) {
                                _score += 10;
                              }
                              setState(() {
                                clickedButtonIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: blackColor.withOpacity(0.3),
                                      width: 1),
                                  color: clickedButtonIndex == index
                                      ? bgColor
                                      : whiteBg,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                  child: MyFonts.subHeading(
                                data: _quizQuestions[_index]['options'][index],
                                color: buttonColor,
                                fontweight: FontWeight.w500,
                              )),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            Container(
              child: _index==9? SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isDialogBoxOpen=true;
                          });
                         _timesUp("Your Scores are:");
                         
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor),
                        child: MyFonts.bodyFont(
                          data: "Scores",
                          color: whiteBg,
                          fontweight: FontWeight.w500,
                        ),
                      )):Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_index < _quizQuestions.length - 1) {
                            clickedButtonIndex = -1;
                            setState(() {
                              _index++;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteBg,
                        ),
                        child: MyFonts.bodyFont(
                          data: "Skip",
                          color: blackColor,
                          fontweight: FontWeight.w500,
                        ),
                      )),
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          print(_index);
                          if (_index < _quizQuestions.length - 1) {
                            setState(() {
                              _index++;
                              clickedButtonIndex = -1;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor),
                        child: MyFonts.bodyFont(
                          data: "Save & Next",
                          color: whiteBg,
                          fontweight: FontWeight.w500,
                        ),
                      )),
                ],
              )
            )
          ],
        ),
      )),
    );
  }
}
