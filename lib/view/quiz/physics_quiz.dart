import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/fonts.dart';
import 'package:quiz/view/navigation/home.dart';

class PhysicsQuiz extends StatefulWidget {
  PhysicsQuiz({super.key});

  @override
  State<PhysicsQuiz> createState() => PhysicsQuizState();
}

class PhysicsQuizState extends State<PhysicsQuiz> {
  int _index = 0;

  final List<Map<String, dynamic>> _quizQuestions = [
    {
      'question': 'What is the SI unit of force?',
      'options': ['Newton', 'Joule', 'Watt', 'Kilogram'],
      'answer': 'Newton'
    },
    {
      'question': 'Which of the following is a non-contact force?',
      'options': [
        'Frictional force',
        'Gravitational force',
        'Muscular force',
        'Electrostatic force'
      ],
      'answer': 'Gravitational force'
    },
    {
      'question': 'The rate of change of velocity is called:',
      'options': ['Acceleration', 'Speed', 'Velocity', 'Displacement'],
      'answer': 'Acceleration'
    },
    {
      'question':
          'The tendency of a body to resist a change in its state of rest or uniform motion is called:',
      'options': ['Inertia', 'Momentum', 'Force', 'Work'],
      'answer': 'Inertia'
    },
    {
      'question': 'The energy possessed by a body due to its motion is called:',
      'options': [
        'Kinetic energy',
        'Potential energy',
        'Mechanical energy',
        'Sound energy'
      ],
      'answer': 'Kinetic energy'
    },
    {
      'question':
          'The energy possessed by a body due to its position or configuration is called:',
      'options': [
        'Kinetic energy',
        'Potential energy',
        'Mechanical energy',
        'Sound energy'
      ],
      'answer': 'Potential energy'
    },
    {
      'question': 'The SI unit of energy is:',
      'options': ['Joule', 'Watt', 'Newton', 'Kilogram'],
      'answer': 'Joule'
    },
    {
      'question':
          'The process of transfer of heat energy by direct contact is called:',
      'options': ['Conduction', 'Convection', 'Radiation', 'Evaporation'],
      'answer': 'Conduction'
    },
    {
      'question':
          'The process of transfer of heat energy by the movement of fluids is called:',
      'options': ['Conduction', 'Convection', 'Radiation', 'Evaporation'],
      'answer': 'Convection'
    },
    {
      'question':
          'The process of transfer of heat energy by electromagnetic waves is called:',
      'options': ['Conduction', 'Convection', 'Radiation', 'Evaporation'],
      'answer': 'Radiation'
    },
    {
      'question': 'The unit of electric current is:',
      'options': ['Volt', 'Ampere', 'Ohm', 'Watt'],
      'answer': 'Ampere'
    },
    {
      'question': 'The resistance of a conductor depends on its:',
      'options': [
        'Length',
        'Cross-sectional area',
        'Material',
        'All of the above'
      ],
      'answer': 'All of the above'
    },
    {
      'question': 'The device used to measure electric current is called:',
      'options': ['Ammeter', 'Voltmeter', 'Ohmmeter', 'Galvanometer'],
      'answer': 'Ammeter'
    },
    {
      'question': 'The device used to measure potential difference is called:',
      'options': ['Ammeter', 'Voltmeter', 'Ohmmeter', 'Galvanometer'],
      'answer': 'Voltmeter'
    },
    {
      'question': 'The principle of conservation of energy states that:',
      'options': [
        'Energy can be created but cannot be destroyed',
        'Energy can be destroyed but cannot be created',
        'Energy can neither be created nor destroyed',
        'Energy can be created and destroyed'
      ],
      'answer': 'Energy can neither be created nor destroyed'
    },
    {
      'question': 'The image formed by a plane mirror is:',
      'options': [
        'Real and inverted',
        'Virtual and inverted',
        'Real and erect',
        'Virtual and erect'
      ],
      'answer': 'Virtual and erect'
    },
    {
      'question': 'The focal length of a convex lens is:',
      'options': ['Positive', 'Negative', 'Zero', 'Infinite'],
      'answer': 'Positive'
    },
    {
      'question': 'The focal length of a concave lens is:',
      'options': ['Positive', 'Negative', 'Zero', 'Infinite'],
      'answer': 'Negative'
    },
    {
      'question':
          'The phenomenon of bending of light as it passes from one medium to another is called:',
      'options': ['Reflection', 'Refraction', 'Diffraction', 'Dispersion'],
      'answer': 'Refraction'
    },
    {
      'question':
          'The splitting of white light into its constituent colors is called:',
      'options': ['Reflection', 'Refraction', 'Diffraction', 'Dispersion'],
      'answer': 'Dispersion'
    }
  ];

  int _seconds = 59;

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
          isDialogBoxOpen == false
              ? _timesUp("Time's Up! \n Your Score is:")
              : null;
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
          title: MyFonts.subHeading(data: title, color: buttonColor, size: 20),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyFonts.bodyFont(data: '$_score', color: buttonColor, size: 45),
              SizedBox(
                width: 10,
              ),
              MyFonts.bodyFont(data: 'Points', color: buttonColor, size: 30),
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
            MyFonts.subHeading(data: "Physics Quiz", color: blackColor),
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
                child: _index == 9
                    ? SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isDialogBoxOpen = true;
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
                        ))
                    : Row(
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
                      ))
          ],
        ),
      )),
    );
  }
}
