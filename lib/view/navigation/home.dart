// for showing questions type options i need to use condition [where chapter id is equal to that id which is choose by user] then [add those catagory id in list  from CATEGORY_TAG_MASTER].
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/fonts.dart';
import 'package:quiz/constants/widgets/customWidget.dart';
import 'package:quiz/database/data.dart';
import 'package:quiz/view/navigation/quiz.dart';

class HomePage extends StatefulWidget {
  final String className;
  HomePage({super.key, required this.className});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? classDropdownValue;

  String? chapterDropdownValue;

  String? id;
  List<Map<String, String>> classes = [];

  List<Map<String, String>> classChapters = [];
  List<Map<String, String>> examChapters = [];
  List<Map<String, String>> catagoryTagMaster = [];
  List<Map<String, String>> catagoryMaster = [];
  List<String> questionTypeIDs = [];
  List<Map<String, String>> questionMaster = [];

  final nameController = TextEditingController();

  final subjectController = TextEditingController(text: "Computer");
  List<Color> colorPallets = [
    Color(0xffff5252),
    Color(0xffff4081),
    Color(0xffe040fb),
    Color(0xff7c4dff),
    Color(0xff536dfe),
    Color(0xff448aff)
  ];

  @override
  void initState() {
    super.initState();

    classes = data["Kips"]!["CLASS"] as List<Map<String, String>>;

    examChapters = data["Kips"]!["CHAPTER"] as List<Map<String, String>>;

    catagoryTagMaster =
        data["Kips"]!["CATEGORY_TAG_MASTER"] as List<Map<String, String>>;

    catagoryMaster =
        data["Kips"]!["CATEGORY_MASTER"] as List<Map<String, String>>;
    questionMaster =
        data["Kips"]!["QUESTION_MASTER"] as List<Map<String, String>>;

    final jsonObj = classes.firstWhere((element) {
      return element["NAME"] == "Class-${widget.className}";
    });

    for (var i = 0; i < examChapters.length; i++) {
      if (examChapters[i]["CLASSID"] == jsonObj["ID"]) {
        classChapters.add(examChapters[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomWidget.buildAppBar(
          title: "Home Page",
          size: 20,
          appBarColor: buttonColor,
          textColor: bgColor,
          titleCenter: false,
          leadingNeeded: true,
          leadingColor: bgColor,
          context: context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.all(screenPadding),
              color: buttonColor,
              child: MyFonts.heading(
                  data: "What Subject do \nyou want to improve today?",
                  size: 28,
                  fontweight: FontWeight.w600,
                  color: bgColor),
            ),
            SearchChapters(
                catagoryMaster: catagoryMaster,
                catagoryTagMaster: catagoryTagMaster,
                questionMaster: questionMaster,
                classChapters: classChapters,
                questionTypeIDs: questionTypeIDs,
                classes: classes,
                examChapters: examChapters)
          ],
        ),
      )),
    );
  }
}

class SearchChapters extends StatefulWidget {
  SearchChapters(
      {super.key,
      required this.catagoryMaster,
      required this.catagoryTagMaster,
      required this.questionMaster,
      required this.classChapters,
      required this.questionTypeIDs,
      required this.classes,
      required this.examChapters});
  List<Map<String, String>> classes = [];

  List<Map<String, String>> classChapters = [];
  List<Map<String, String>> examChapters = [];
  List<Map<String, String>> catagoryTagMaster = [];
  List<Map<String, String>> catagoryMaster = [];
  List<String> questionTypeIDs = [];
  List<Map<String, String>> questionMaster = [];

  @override
  State<SearchChapters> createState() => _SearchChaptersState();
}

class _SearchChaptersState extends State<SearchChapters> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredChapters = [];

  @override
  void initState() {
    super.initState();
    filteredChapters = List.from(widget.classChapters);
    _searchController.addListener(() {
      setState(() {
        filteredChapters = widget.classChapters
            .where((chapter) => chapter["NAME"]!
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                isDense: true,
                labelText: "Search",
                labelStyle: GoogleFonts.poppins(
                  color: darkBlack,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: buttonColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.64,
          child: Container(
            color: bgColor,
            child: Scrollbar(
              
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: screenPadding),
                itemCount: filteredChapters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        widget.questionTypeIDs.clear();
                        final chapterID = filteredChapters[index]["ID"];
                        final List<Map<String, String>> categories = [];
                        final List<Map<String, String>> questions = [];
                        for (var element in widget.catagoryTagMaster) {
                          if (element["CHAPTERID"] == chapterID) {
                            widget.questionTypeIDs.add(element["CATEGORYID"]!);
                          }
                        }
              
                        for (var categoriesIds in widget.catagoryMaster) {
                          for (var questionTypeIDs in widget.questionTypeIDs) {
                            if (categoriesIds["ID"] == questionTypeIDs) {
                              categories.add(categoriesIds);
                            }
                          }
                        }
              
                        _questionTypeDialogBox(context, categories, chapterID,
                            index, questions, widget.questionMaster);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: buttonColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  )),
                              margin: EdgeInsets.all(0),
                              padding: EdgeInsets.all(0),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Center(
                                child: MyFonts.heading(
                                    data: "Ch - ${index + 1}",
                                    size: 17,
                                    fontweight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              filteredChapters[index]["NAME"]!,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<dynamic> _questionTypeDialogBox(
      BuildContext context,
      List<Map<String, String>> catagories,
      String? chapterID,
      int index,
      List<Map<String, String>> questions,
      List<Map<String, String>> questionMaster) {
    return showGeneralDialog(
        barrierDismissible: false,
        context: context,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Container();
        },
        transitionBuilder: (ctx, a1, a2, widget) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                  backgroundColor: Colors.white,
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: MyFonts.heading(
                            data: "Select Question Type", color: darkBlack),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(ctx);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          )),
                    ],
                  ),
                  content: SizedBox(
                      width: double.maxFinite,
                      height: 300,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (context, index) => ListTile(
                          leading: MyFonts.bodyFont(
                            data: "Option ${index + 1}: ",
                            color: darkBlack,
                            size: 14,
                            fontweight: FontWeight.w600,
                          ),
                          title: MyFonts.bodyFont(
                            data: catagories[index]["NAME"]!,
                            color: darkBlack,
                            fontweight: FontWeight.w500,
                            size: 15,
                          ),
                          onTap: () {
                            for (var element in questionMaster) {
                              if (element["CATEGORYID"] ==
                                      catagories[index]["ID"] &&
                                  element["CHAPTERID"] == chapterID) {
                                questions.add(element);
                              }
                            }

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                      question: questions,
                                      catgoryType: catagories[index]["NAME"]!,
                                    )));
                          },
                        ),
                        itemCount: catagories.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      ))),
            ),
          );
        });
  }
}
