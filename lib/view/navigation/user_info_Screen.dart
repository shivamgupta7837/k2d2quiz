// for showing questions type options i need to use condition [where chapter id is equal to that id which is choose by user] then [add those catagory id in list  from CATEGORY_TAG_MASTER].
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/fonts.dart';
import 'package:quiz/database/data.dart';

class UserInfoScreen extends StatefulWidget {
  UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String? classDropdownValue;

  String? chapterDropdownValue;

  String? id;
  List<Map<String, String>> classes = [];

  List<Map<String, String>> classChapters = [];
  List<Map<String, String>> examChapters = [];
  List<Map<String, String>> catagoryTagMaster = [];
  List<Map<String, String>> catagoryMaster = [];
  List<String> questionTypeIDs = [];

  final nameController = TextEditingController();

  final subjectController = TextEditingController(text: "Computer");

  @override
  void initState() {
    super.initState();

    classes = data["Kips"]!["CLASS"] as List<Map<String, String>>;

    examChapters = data["Kips"]!["CHAPTER"] as List<Map<String, String>>;

    catagoryTagMaster =
        data["Kips"]!["CATEGORY_TAG_MASTER"] as List<Map<String, String>>;

    catagoryMaster =
        data["Kips"]!["CATEGORY_MASTER"] as List<Map<String, String>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              classChapters.clear();
              classes.clear();
              examChapters.clear();
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 28,
            )),
        backgroundColor: scaffoldBackgroundColor,
        title: Column(
          children: [
            MyFonts.subHeading(data: "User info", color: blackColor),
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter Name",
                  hintStyle:
                      GoogleFonts.poppins(color: blackColor.withOpacity(0.5)),
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.class_rounded),
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
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: classChapters.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: ListTile(

                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              tileColor:Colors.white,
                              
                              leading: MyFonts.subHeading(
                                  data: "Ch - ${index + 1}:",
                                  size: 14,
                                    fontweight: FontWeight.w600,
                                  color: blackColor),
                              title: MyFonts.bodyFont(
                                  data: classChapters[index]["NAME"]!,
                                  color: blackColor,
                                  size: 16,
                                  fontweight: FontWeight.w500),
                              onTap: () {
                                questionTypeIDs.clear();
                                final chapterID = classChapters[index]["ID"];
                                final List<String> catagories = [];
                                for (var element in catagoryTagMaster) {
                                  if (element["CHAPTERID"] == chapterID) {
                                    questionTypeIDs.add(element["CATEGORYID"]!);
                                  }
                                }

                                for (var catagoriesIds in catagoryMaster) {
                                  for (var questionTypeIDs in questionTypeIDs) {
                                    if (catagoriesIds["ID"] ==
                                        questionTypeIDs) {
                                      catagories.add(catagoriesIds["NAME"]!);
                                    }
                                  }
                                }

                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                        title: Row(
                                          children: [
                                            MyFonts.heading(
                                                data: "Select Question Type",
                                                color: blackColor),
                                            const Spacer(),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pop(ctx);
                                                },
                                                icon: const Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                ))
                                          ],
                                        ),
                                        content: SizedBox(
                                            width: double.maxFinite,
                                            height: 300,
                                            child: ListView.separated(
                                              padding: EdgeInsets.all(0),
                                              itemBuilder: (context, index) =>
                                                  ListTile(
                                                    leading: MyFonts.bodyFont(data: "Option ${index+1}: ",color: blackColor, size: 14,fontweight: FontWeight.w600,),
                                                title: MyFonts.bodyFont(
                                                  data: catagories[index],
                                                  color: blackColor,
                                                   fontweight: FontWeight.w500,
                                                   size: 15,
                                                ),
                                              ),
                                              itemCount: catagories.length, separatorBuilder: (BuildContext context, int index) {  return const Divider(); },
                                            )));
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      )),
    );
  }
}
