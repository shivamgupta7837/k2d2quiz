import 'package:flutter/material.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/fonts.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        centerTitle: true,
        title: MyFonts.subHeading(
            data: "Leaderboard", fontweight: FontWeight.w500),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 28,
            )),
      ),
      backgroundColor: scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: MyFonts.subHeading(data: "1",color: Colors.white),backgroundColor: Color.fromARGB(255, 221, 133, 19),),
              tileColor: Color(0xfff8971a),
              title: MyFonts.bodyFont(data: "Pooja Kapoor",color: Colors.white,fontweight: FontWeight.w400),
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: CircleAvatar(child: MyFonts.subHeading(data: "2"),backgroundColor: Color.fromARGB(255, 194, 194, 197),),
              tileColor: Color(0xffcfced3),
              title: MyFonts.bodyFont(data: "Anil Sharma",color: Colors.white,fontweight: FontWeight.w400),
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: CircleAvatar(child: MyFonts.subHeading(data: "3"),backgroundColor: Color.fromARGB(255, 216, 113, 23)),
              tileColor: Color(0xffec8227),
              title: MyFonts.bodyFont(data: "Kumar Sharma",color: Colors.white,fontweight: FontWeight.w400),
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: bgColor,
              title: MyFonts.bodyFont(data: "Anuj Sharma",color: Colors.black,fontweight: FontWeight.w500),
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: bgColor,
              title: MyFonts.bodyFont(data: "Radha Kumari",color: Colors.black,fontweight: FontWeight.w500),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
