import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/database/data.dart';
import 'package:quiz/view/navigation/fav.dart';
import 'package:quiz/view/navigation/leaderboard.dart';
import 'package:quiz/view/navigation/profile.dart';
import 'package:quiz/view/quiz/user_info_Screen.dart';

import '../../constants/fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _customNavBarIndex = 0;
  String? classDropdownValue;
  String? chapterDropdownValue;
  List<Map<String, String>> classes =
      data["Kips"]!["CLASS"] as List<Map<String, String>>;
  List<Map<String, String>> examChapters =
      data["Kips"]!["CHAPTER"] as List<Map<String, String>>;
  String? id;

  List<Map<String, String>> classChapters = [];
  final nameController = TextEditingController();
  final subjectController = TextEditingController(text: "Computer");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       Container(
      //                               padding: EdgeInsets.all(10),
      //                               decoration: BoxDecoration(
      //                                 borderRadius: BorderRadius.circular(10),
      //                                 color: Colors.white,
      //                               ),
      //                               child: Row(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.center,
      //                                 children: [
      //                                   Icon(
      //                                     Icons.leaderboard,
      //                                     color: buttonColor,
      //                                   ),
      //                                   SizedBox(
      //                                     width: 10,
      //                                   ),
      //                                   MyFonts.subHeading(
      //                                       data: "Leaderboard",
      //                                       color: buttonColor,
      //                                       fontweight: FontWeight.w600)
      //                                 ],
      //                               ),)
      //     ],
      //   ),
      // ),
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title:
            MyFonts.subHeading(data: "Hello Pooja Kapoor", color: buttonColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyFonts.heading(
                    data: "What Subject do \nyou want to improve today?",
                    size: 28,
                    fontweight: FontWeight.w600,
                    color: buttonColor),
                const SizedBox(
                  height: 10,
                ),
                MyFonts.bodyFont(data: "Note: For now there is only subject",color: Colors.red,fontweight: FontWeight.w500),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.62 ,
                  child: GridView.builder(
                      itemCount: 1,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.9
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserInfoScreen()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            height: 150,
                            decoration: BoxDecoration(
                                color: whiteBg.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/geometry.png",
                                  height: 90,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                MyFonts.subHeading(
                                    data: "Computer", color: buttonColor)
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 12,
                ),
                _customNavBar(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _customNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buttonColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: _customNavBarIndex == 0
                ? Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.home_max_sharp,
                          color: buttonColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MyFonts.subHeading(
                            data: "Home",
                            color: buttonColor,
                            fontweight: FontWeight.w600)
                      ],
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        _customNavBarIndex = 0;
                      });
                    },
                    icon: const Icon(
                      Icons.home_max_sharp,
                      color: scaffoldBackgroundColor,
                    ),
                  ),
          ),
          SizedBox(
            child: _customNavBarIndex == 1
                ? Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.leaderboard,
                          color: buttonColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MyFonts.subHeading(
                            data: "Leaderboard",
                            color: buttonColor,
                            fontweight: FontWeight.w600)
                      ],
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        _customNavBarIndex = 1;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Leaderboard()));
                      setState(() {
                        _customNavBarIndex = 0;
                      });
                    },
                    icon: const Icon(
                      Icons.leaderboard_outlined,
                      color: scaffoldBackgroundColor,
                    ),
                  ),
          ),

          //! Fav Button

          SizedBox(
            child: _customNavBarIndex == 2
                ? Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: buttonColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MyFonts.subHeading(
                            data: "Favorites",
                            color: buttonColor,
                            fontweight: FontWeight.w600)
                      ],
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        _customNavBarIndex = 2;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Favorites()));
                      setState(() {
                        _customNavBarIndex = 0;
                      });
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: scaffoldBackgroundColor,
                    ),
                  ),
          ),

          //! Profiles
          SizedBox(
            child: _customNavBarIndex == 3
                ? Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: buttonColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyFonts.subHeading(
                            data: "Profiles",
                            color: buttonColor,
                            fontweight: FontWeight.w600)
                      ],
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        _customNavBarIndex = 3;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                      setState(() {
                        _customNavBarIndex = 0;
                      });
                    },
                    icon: Icon(
                      Icons.person_2_outlined,
                      color: scaffoldBackgroundColor,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// for showing questions type options i need to use condition [where chapter id is equal to that id which is choose by user] then [add those catagory id in list  from CATEGORY_TAG_MASTER].


//! This will use when we have image in grid view
/*


    TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Enter Name",
                    hintStyle: GoogleFonts.poppins(
                        color: blackColor.withOpacity(0.5)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: blackColor.withOpacity(0.5),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  dropdownColor: Colors.white,
                  padding: const EdgeInsets.all(5),
                  decoration: InputDecoration(
                      hintText: "Enter Class",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      isDense: true),
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: blackColor),
                  value: classDropdownValue,
                  items: classes
                      .map((e) => e["NAME"]!)
                      .toList()
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    classChapters.clear();
                    final jsonObj = classes.firstWhere((element) {
                      return element["NAME"] == newValue;
                    });
            
                    setState(() {
                      id = jsonObj["ID"];
                      classDropdownValue = newValue;
                    });
            
                    for (var i = 0; i < examChapters.length; i++) {
                      if (examChapters[i]["CLASSID"] == id) {
                        classChapters.add(examChapters[i]);
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                 TextField(
                  readOnly: true,
                  controller: nameController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Enter Subject",
                    hintStyle: GoogleFonts.poppins(
                        color: blackColor.withOpacity(0.5)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: blackColor.withOpacity(0.5),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                // DropdownButtonFormField<String>(
                //   decoration: InputDecoration(
                //       hintText: "Enter Chapters",
                //       border:
                //           OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                //       isDense: true),
                //   style: GoogleFonts.poppins(
                //       fontWeight: FontWeight.w500, fontSize: 14, color: blackColor),
                //   value: chapterDropdownValue,
                //   items: class_chapters
                //       .map((e) => e["NAME"]!)
                //       .toList()
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       chapterDropdownValue = newValue;
                //     });
                //   },
                // ),
            
                const SizedBox(height: 30),
                classChapters.isEmpty
                    ? Center(
                        child: MyFonts.bodyFont(
                            data: "Please Select class to view chapters",
                            size: 16,
                            fontweight: FontWeight.w500,
                            color: buttonColor),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                          itemCount: classChapters.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                tileColor: whiteBg.withOpacity(0.6),
                                leading: MyFonts.subHeading(
                                    data: "Ch - ${index + 1}:",
                                    size: 14,
                                    color: buttonColor),
                                onTap: () {},
                                title: MyFonts.bodyFont(
                                    data: classChapters[index]["NAME"]!,
                                    color: buttonColor,
                                    size: 16,
                                    fontweight: FontWeight.w500),
                              ),
                            );
                          },
                        ),
                      ),

*/