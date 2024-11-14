// import 'package:flutter/material.dart';
// import 'package:quiz/constants/alignments.dart';
// import 'package:quiz/constants/colors.dart';
// import 'package:quiz/constants/fonts.dart';
// import 'package:quiz/view/quiz/physics_quiz.dart';

// class Favorites extends StatelessWidget {
//   const Favorites({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//          appBar: AppBar(
//         centerTitle: true,
//         title: MyFonts.subHeading(data: "Favouites Quizes"),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
            
//             icon: const Icon(
//               Icons.arrow_circle_left_outlined,
//               size: 28,
//             )),
//         backgroundColor: bgColor,
//       ),
//         backgroundColor: bgColor,
//       body: Padding(
//         padding: const EdgeInsets.all(screenPadding),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 3,
//                 itemBuilder: (context,index){
//                 return   GestureDetector(
//             onTap: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => PhysicsQuiz())),
//             child: Container(
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               decoration: BoxDecoration(
//                   color: whiteBg.withOpacity(0.6),
//                   borderRadius: BorderRadius.circular(20)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(
//                       "assets/images/physics.png",
//                       height: 50,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   MyFonts.subHeading(data: "Physics", color: buttonColor)
//                 ],
//               ),
//             ),
//           );
//               }),
//             )
//           ],
//         ),
//       )
//     );
//   }
// }