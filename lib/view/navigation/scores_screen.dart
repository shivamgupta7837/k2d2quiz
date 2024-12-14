import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/fonts.dart';
import 'package:quiz/constants/utils/scores_status.dart';
import 'package:quiz/constants/widgets/customWidget.dart';
import 'package:quiz/view/navigation/home.dart';

class ScoresScreen extends StatelessWidget {
  ScoresStatus scoresStatus = ScoresStatus.Excellent;
  final String status;
  final String score;
  ScoresScreen({super.key, required this.status, required this.score});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case "excellent":
        {
          scoresStatus = ScoresStatus.Excellent;
        }
        break;
      case "lessMarks":
        {
          scoresStatus = ScoresStatus.LessMarks;
        }
        break;
      case "medium":
        {
          scoresStatus = ScoresStatus.Medium;
        }
        break;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomWidget.buildAppBar(
          title: "Your Score",
          size: 20,
          appBarColor: Colors.white,
          textColor: darkBlack,
          titleCenter: true,
          leadingNeeded: false,
          needLeading: false,
          leadingColor: darkBlack,
          context: context),
      body: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Excelent

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                Lottie.asset( status == "excellent" ?"assets/icons/first.json":status == "lessMarks" ?"assets/icons/bad.json":"assets/icons/happy.json",
                      fit: BoxFit.cover, height: 300),
                const  SizedBox(
                    height: 30,
                  ),
                  MyFonts.heading(
                      data: "You have scored",
                      size: 24,
                      fontweight: FontWeight.w600,
                      color: darkBlack),
                  Text(
                    "$score Points",
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: darkBlack),
                  ),
                ],
              ),
            ),

            Center(
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    onPressed: () async {
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(className: '1',)), (route)=>false);
         
                    },
                    child: Text(
                      "Go to Home",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    )),
              ),
            ),

            // Medium

            // Less marks
          ],
        ),
      ),
    );
  }
}
