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
                    List<Map<String, String>> chapters =  data["Kips"]!["CHAPTER"] as List< Map<String, String>>;
                    List<Map<String, String>> exam_chapters =  data["Kips"]!["EXAM_CHAPTER"] as List< Map<String, String>>;
                    List<Map<String, String>> exam_question_master =  data["Kips"]!["EXAM_QUESTION_MASTER"] as List< Map<String, String>>;
                    List<Map<String, String>> exam_option_master =  data["Kips"]!["EXAM_OPTION_MASTER"] as List< Map<String, String>>;
                    List<Map<String, String>> exam_catagory_master =  data["Kips"]!["EXAM_CATEGORY_TAG_MASTER"] as List< Map<String, String>>;
                    List<Map<String, String>> catagory_master =  data["Kips"]!["CATEGORY_MASTER"] as List< Map<String, String>>;
                    List<Map<String, String>> catagory_tag_master =  data["Kips"]!["CATEGORY_TAG_MASTER"] as List< Map<String, String>>;
                    List<Map<String, String>> option_master =  data["Kips"]!["OPTION_MASTER"] as List< Map<String, String>>;
                    List<Map<String, String>> question_master =  data["Kips"]!["QUESTION_MASTER"] as List< Map<String, String>>;
                    List<Map<String, String>> classes =  data["Kips"]!["CLASS"] as List< Map<String, String>>;

                     for (int i=0;i<chapters.length;i++){ 
                       print(chapters[i]["CLASSID"] == 1);
                     }
                      // final xmlString =
                      //     await rootBundle.loadString('assets/app_data/data.xml');
                      // final XmlDocument document = XmlDocument.parse(xmlString);

                      // // Access elements and attributes
                      // final rootElement = document.children;
                      // rootElement.forEach((element) {
                      //   print(element.getElement("EXAM_CHAPTER"));
                      // });
                      // print("Root Element: ${}");
                      // final childElements =
                      //     rootElement.findAllElements('child_tag');

                      // for (final child in childElements) {
                      //   final childText = child.value;
                      //   print(childText);
                      //   final childAttribute =
                      //       child.getAttribute('attribute_name');
                      //   print(childAttribute);
                      // }
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
