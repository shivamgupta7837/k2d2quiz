import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/database/data.dart';
import 'package:quiz/view/navigation/fav.dart';
import 'package:quiz/view/navigation/leaderboard.dart';
import 'package:quiz/view/navigation/profile.dart';
import 'package:quiz/view/navigation/user_info_Screen.dart';

import '../../constants/fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _customNavBarIndex = 0;


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
        title:   MyFonts.bodyFont(data: "Note: For now there is only subject",color: Colors.red,fontweight: FontWeight.w500),
           
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
                  height: 15,
                ),
                    Divider(color: buttonColor.withOpacity(0.5),),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65 ,
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
            //    _customNavBar(context)
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
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Favorites()));
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
