// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:quiz/constants/alignments.dart';
// import 'package:quiz/constants/colors.dart';
// import 'package:quiz/constants/fonts.dart';
// import 'package:quiz/view/navigation/home.dart';

// class GeometricsQuiz extends StatefulWidget {
//   GeometricsQuiz({super.key});

//   @override
//   State<GeometricsQuiz> createState() => _GeometricsQuizState();
// }

// class _GeometricsQuizState extends State<GeometricsQuiz> {
//   int _index = 0;

//   final List<Map<String, dynamic>> _quizQuestions = [
//     {
//       'question': 'What is the sum of the angles in a triangle?',
//       'options': ['180 degrees', '360 degrees', '90 degrees', '270 degrees'],
//       'answer': '180 degrees'
//     },
//     {
//       'question':
//           'A quadrilateral with one pair of parallel sides is called a:',
//       'options': ['Parallelogram', 'Trapezium', 'Rhombus', 'Square'],
//       'answer': 'Trapezium'
//     },
//     {
//       'question':
//           'The line segment joining the center of a circle to a point on the circle is called:',
//       'options': ['Chord', 'Radius', 'Diameter', 'Secant'],
//       'answer': 'Radius'
//     },
//     {
//       'question': 'The Pythagorean Theorem states that:',
//       'options': ['a² + b² = c²', 'a² - b² = c²', 'a + b = c', 'a - b = c'],
//       'answer': 'a²'
//     },
//     {
//       'question': 'The area of a parallelogram is:',
//       'options': [
//         'base × height',
//         '1/2 × base × height',
//         'length × breadth',
//         'πr²'
//       ],
//       'answer': 'base × height'
//     },
//     {
//       'question': 'The volume of a cube with side \'a\' is:',
//       'options': ['a³', '3a', '6a²', 'a²'],
//       'answer': 'a³'
//     },
//     {
//       'question': 'A line that intersects a circle at two points is called a:',
//       'options': ['Chord', 'Tangent', 'Secant', 'Radius'],
//       'answer': 'Secant'
//     },
//     {
//       'question': 'The sum of the interior angles of a quadrilateral is:',
//       'options': ['180 degrees', '360 degrees', '540 degrees', '720 degrees'],
//       'answer': '360 degrees'
//     },
//     {
//       'question': 'A triangle with all sides equal is called:',
//       'options': [
//         'Scalene triangle',
//         'Isosceles triangle',
//         'Equilateral triangle',
//         'Right-angled triangle'
//       ],
//       'answer': 'Equilateral triangle'
//     },
//     {
//       'question':
//           'A quadrilateral with all sides equal and all angles equal is a:',
//       'options': ['Square', 'Rectangle', 'Rhombus', 'Trapezium'],
//       'answer': 'Square'
//     }
//   ];

//   int _seconds = 59;

//   Timer? _timer;
//   int _score = 0;

//   int clickedButtonIndex = -1;

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   bool isDialogBoxOpen = false;

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_seconds > 0) {
//           _seconds--;
//         } else {
//          isDialogBoxOpen==false?  _timesUp("Time's Up! \n Your Score is:"):null;
//           _timer?.cancel();
//         }
//       });
//     });
//   }

//   Future<dynamic> _timesUp(String title) {
//     return showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               backgroundColor: Colors.white,
//               title: MyFonts.subHeading(
//                   data: title,
//                   color: buttonColor,
//                   size: 20),
//               content: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MyFonts.bodyFont(
//                       data: '$_score', color: buttonColor, size: 45),
//                       SizedBox(width: 10,),
//                   MyFonts.bodyFont(
//                       data: 'Points', color: buttonColor, size: 30),
//                 ],
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   child: MyFonts.subHeading(data: 'OK'),
//                   onPressed: () {
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(builder: (context) => HomePage()),
//                       (route) => false,
//                     );
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: ,
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_circle_left_outlined,
//               size: 28,
//             )),
//         backgroundColor: scaffoldBackgroundColor,
//         title: Column(
//           children: [
//             MyFonts.subHeading(data: "Geometric Quiz", color: blackColor),
//             MyFonts.bodyFont(data: "10 Questions", color: blackColor, size: 12),
//           ],
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               radius: 20,
//               backgroundColor: buttonColor,
//               child: MyFonts.subHeading(data: "${_seconds}", color: whiteBg),
//             ),
//           )
//         ],
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: EdgeInsets.all(screenPadding),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                   color: whiteBg, borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MyFonts.subHeading(
//                           data: "Question ${_index + 1}",
//                           color: blackColor,
//                           fontweight: FontWeight.w400,
//                           size: 15),
//                       Container(
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                             color: bgColor,
//                             borderRadius: BorderRadius.circular(5)),
//                         child: MyFonts.heading(
//                             data: "10 Points",
//                             color: blackColor,
//                             fontweight: FontWeight.w600,
//                             size: 10),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   MyFonts.subHeading(
//                     data: _quizQuestions[_index]['question'],
//                     color: buttonColor,
//                     fontweight: FontWeight.w500,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.3,
//                     child: ListView.builder(
//                         itemCount: _quizQuestions[_index]['options'].length,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               if (_quizQuestions[_index]['options'][index] ==
//                                   _quizQuestions[_index]['answer']) {
//                                 _score += 10;
//                               }
//                               setState(() {
//                                 clickedButtonIndex = index;
//                               });
//                             },
//                             child: Container(
//                               margin: EdgeInsets.all(10),
//                               padding: EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: blackColor.withOpacity(0.3),
//                                       width: 1),
//                                   color: clickedButtonIndex == index
//                                       ? bgColor
//                                       : whiteBg,
//                                   borderRadius: BorderRadius.circular(25)),
//                               child: Center(
//                                   child: MyFonts.subHeading(
//                                 data: _quizQuestions[_index]['options'][index],
//                                 color: buttonColor,
//                                 fontweight: FontWeight.w500,
//                               )),
//                             ),
//                           );
//                         }),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               child: _index==9? SizedBox(
//                       height: 50,
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             isDialogBoxOpen=true;
//                           });
//                          _timesUp("Your Scores are:");
                         
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: buttonColor),
//                         child: MyFonts.bodyFont(
//                           data: "Scores",
//                           color: whiteBg,
//                           fontweight: FontWeight.w500,
//                         ),
//                       )):Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                       height: 50,
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_index < _quizQuestions.length - 1) {
//                             clickedButtonIndex = -1;
//                             setState(() {
//                               _index++;
//                             });
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: whiteBg,
//                         ),
//                         child: MyFonts.bodyFont(
//                           data: "Skip",
//                           color: blackColor,
//                           fontweight: FontWeight.w500,
//                         ),
//                       )),
//                   SizedBox(
//                       height: 50,
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           print(_index);
//                           if (_index < _quizQuestions.length - 1) {
//                             setState(() {
//                               _index++;
//                               clickedButtonIndex = -1;
//                             });
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: buttonColor),
//                         child: MyFonts.bodyFont(
//                           data: "Save & Next",
//                           color: whiteBg,
//                           fontweight: FontWeight.w500,
//                         ),
//                       )),
//                 ],
//               )
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }





import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}