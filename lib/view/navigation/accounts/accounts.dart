import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/fonts.dart';
import 'package:quiz/model/user_model.dart';
import 'package:quiz/view/navigation/accounts/add_Accounts.dart';

import '../../../constants/colors.dart';
import '../../../constants/widgets/customWidget.dart';

class Accounts extends StatefulWidget {
  Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  List<Map<String, dynamic>> users = [
    {
      "id": "1",
      "name": "Ram Kumar",
      "class": "Class 1",
      "age": "9",
    },
    {
      "id": "2",
      "name": "Heemesh Sharma",
      "class": "Class 2",
      "age": "8",
    }
  ];

  String name = "";
  String age = "";
  String studentClass = "";
  int index = 0;

  @override
  void initState() {
    name = users.first["name"];
    age = users.first["age"];
    studentClass = users.first["class"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            size: 28,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        backgroundColor: buttonColor,
        title: MyFonts.bodyFont(
            data: "Users",
            color: Colors.white,
            size: 18,
            fontweight: FontWeight.w500),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
                dropdownColor: buttonColor,
                focusColor: Colors.white,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                underline: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.4, color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                borderRadius: BorderRadius.circular(10),
                isDense: true,
                value: name,
                items: [
                  DropdownMenuItem(
                    value: users[0]["name"],
                    child: MyFonts.bodyFont(
                        data: users[0]["name"],
                        fontweight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  DropdownMenuItem(
                    value: users[1]["name"],
                    child: MyFonts.bodyFont(
                      data: users[1]["name"],
                      fontweight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Add Account",
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: bgColor,
                        ),
                        onPressed: () {
                          // form for add account
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddAccounts(),
                              ));
                        },
                        child: MyFonts.bodyFont(
                          data: "Add Account",
                          fontweight: FontWeight.w600,
                          color: darkBlack,
                        )),
                  ),
                ],
                //         items: users.map<DropdownMenuItem<String>>((String value) {
                //   return DropdownMenuItem<String>(
                //     value: value,
                //     child: Text(value),
                //   );
                // }).toList(),
                onChanged: (value) {
                  setState(() {
                    name = value.toString();
                    studentClass = value.toString();
                    age = value.toString();
                  });
                }),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  Icon(Icons.person_off,size: 50,color: buttonColor,),

                  //   TextButton(onPressed: (){
                  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAccounts()));
                  //   }, child:Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(Icons.add),
                  //       Text("Add New User",style: GoogleFonts.dmSans(fontWeight: FontWeight.w600,fontSize: 16,color: buttonColor),),
                  //     ],
                  //   ),)
                ],
              ),
            ),
            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 70,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      MyFonts.subHeading(data: "Name: ", size: 16),
                      MyFonts.bodyFont(data: name, fontweight: FontWeight.w400),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Divider(),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      MyFonts.subHeading(data: "Class: ", size: 16),
                      MyFonts.bodyFont(
                          data: studentClass, fontweight: FontWeight.w400),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Divider(),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      MyFonts.subHeading(data: "Age: ", size: 16),
                      MyFonts.bodyFont(data: age, fontweight: FontWeight.w400),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Divider(),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      MyFonts.subHeading(data: "Gender: ", size: 16),
                      MyFonts.bodyFont(data: name, fontweight: FontWeight.w400),
                    ],
                  ),
                  SizedBox(height: 50,),
                    Center(
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor),
                          onPressed: () async {
                          
                          },
                          child: Text(
                            "Go To Home Page",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
