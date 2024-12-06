import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/fonts.dart';
import 'package:quiz/database/data.dart';
import 'package:xml/xml.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyFonts.subHeading(data: "Profile", fontweight: FontWeight.w500),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: bgColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 50,
                        child: Center(
                          child: Image.asset(
                            "assets/images/profile.png",
                            height: 100,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white60),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.57,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                MyFonts.bodyFont(
                                    color: buttonColor,
                                    data: "Name:  ",
                                    fontweight: FontWeight.bold),
                                SizedBox(
                                  width: 5,
                                ),
                                MyFonts.bodyFont(
                                    color: buttonColor, data: "Pooja Kapoor"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyFonts.bodyFont(
                                  color: buttonColor,
                                  data: "Phone:",
                                  fontweight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                MyFonts.bodyFont(
                                  color: buttonColor,
                                  data: "9874352424",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                MyFonts.bodyFont(
                                  color: buttonColor,
                                  data: "Email:",
                                  fontweight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                    child: MyFonts.bodyFont(
                                  color: buttonColor,
                                  data: "poojakapoor@gmail.com",
                                )),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyFonts.bodyFont(
                    data: "Logout",
                    color: buttonColor,
                    size: 16,
                    fontweight: FontWeight.w500),
                IconButton(
                    onPressed: () async {
                  
                    },
                    icon: Icon(
                      Icons.logout,
                      color: buttonColor,
                      size: 18,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
