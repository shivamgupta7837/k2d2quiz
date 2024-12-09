import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lordicon/lordicon.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/fonts.dart';
import 'package:quiz/database/data.dart';
import 'package:quiz/view/navigation/home.dart';
import 'package:quiz/view/navigation/choices.dart';

class QuizScreen extends StatefulWidget {
  final List<Map<String, String>> question;
  final String catgoryType;
  QuizScreen(
      {super.key,
      required this.question,
      required this.catgoryType,});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _index = 0;
  int _seconds = 59;

  Timer? _timer;
  int _score = 0;

  int clickedButtonIndex = -1;
  List<Map<String, String>> optionsMasters = [];
  List<Map<String, String>> optionsMasterToOptions = [];
  final player = AudioPlayer();
  final player2 = AudioPlayer();
  bool isMute = false;

  void _playAudio() async {
    final duration = await player.setAsset("assets/audios/quiz.mp3");
    await player.play();
    print("Duration: ${duration!.inMinutes}");
  }

  void _stopAudio() async {
    final duration = await player.setAsset("assets/audios/quiz.mp3");
    await player.pause();
  }

  void _playQuizOptionAudio() async {
    final duration =
        await player2.setAsset("assets/audios/task_completion.mp3");
    await player2.play();
    print("Duration: ${duration!.inMinutes}");
  }

  void _stopQuizOptionAudio() async {
    final duration =
        await player2.setAsset("assets/audios/task_completion.mp3");
    await player2.pause();
  }

  @override
  void initState() {
    _playAudio();
    optionsMasters =
        data["Kips"]!["OPTION_MASTER"] as List<Map<String, String>>;
    for (var element in optionsMasters) {
      if (widget.question[0]["ID"] == element["QUESTIONID"]) {
        optionsMasterToOptions.add(element);
      }
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _startTimer();
    });
  }

  bool isDialogBoxOpen = false;

  void _startTimer() {
    if (widget.catgoryType == "Rapid Fire Round") {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: MyFonts.subHeading(
                  data:
                      "You have time limit of $_seconds seconds in Rapid fire round. You can see timer in top right corner.",
                  size: 15,
                  color: Colors.red),
              actions: [
                TextButton(
                    child: MyFonts.bodyFont(
                      data: 'Ok',
                      color: buttonColor,
                      fontweight: FontWeight.w500,
                    ),
                    onPressed: () {
                      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                        setState(() {
                          if (_seconds > 0) {
                            _seconds--;
                          } else {
                            isDialogBoxOpen == false
                                ? _timesUp("Time's Up! \n Your Score is:")
                                : null;
                            _timer?.cancel();
                          }
                        });
                      });
                      Navigator.pop(context);
                    })
              ],
            );
          });
    }
  }

  Future<dynamic> _timesUp(String title) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        _playQuizOptionAudio();
        return AlertDialog(
          backgroundColor: Colors.white,
          title: MyFonts.subHeading(data: title, color: buttonColor, size: 20),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyFonts.bodyFont(data: '$_score', color: buttonColor, size: 45),
              const SizedBox(
                width: 10,
              ),
              MyFonts.bodyFont(data: 'Points', color: buttonColor, size: 30),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: MyFonts.subHeading(data: 'OK'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        backgroundColor: Colors.white,
                        title: MyFonts.subHeading(
                            data: "Are you sure you want to exit?",
                            color: buttonColor,
                            size: 18),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: MyFonts.bodyFont(
                                  data: 'No',
                                  color: buttonColor,
                                  fontweight: FontWeight.w500,
                                  size: 15)),
                          TextButton(
                              onPressed: () {
                                _stopAudio();
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: MyFonts.bodyFont(
                                  data: 'Yes',
                                  color: Colors.red,
                                  fontweight: FontWeight.w500,
                                  size: 15))
                        ]);
                  });
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 28,
            )),
        backgroundColor: scaffoldBackgroundColor,
        title: Column(
          children: [
            MyFonts.subHeading(
                data: "${widget.catgoryType}", color: blackColor),
            MyFonts.bodyFont(
                data: "${widget.question.length} Questions",
                color: blackColor,
                size: 12),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (isMute == true) {
                  _playAudio();
                  setState(() {
                    isMute = false;
                  });
                } else {
                  _stopAudio();
                  setState(() {
                    isMute = true;
                  });
                }
              },
              icon: isMute == true
                  ? const Icon(
                      Icons.volume_off_rounded,
                      size: 28,
                    )
                  : const Icon(Icons.volume_up)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.catgoryType == "Rapid Fire Round"
                ? CircleAvatar(
                    radius: 20,
                    backgroundColor: buttonColor,
                    child:
                        MyFonts.subHeading(data: "${_seconds}", color: whiteBg),
                  )
                : null,
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ColoredBox(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyFonts.subHeading(
                            data: "Question ${_index + 1}",
                            color: Colors.white,
                            fontweight: FontWeight.w400,
                            size: 15),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: MyFonts.heading(
                              data: "10 Points",
                              color: blackColor,
                              fontweight: FontWeight.w600,
                              size: 10),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyFonts.subHeading(
                      data: widget.question[_index]['QUESTION'].toString(),
                      color: Colors.white,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                          itemCount: optionsMasterToOptions.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if (widget.question[_index]['RIGHTANSWER'] ==
                                    optionsMasterToOptions[index]["OPTION"]) {
                                  _score += 10;
                                }
                                setState(() {
                                  clickedButtonIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: blackColor.withOpacity(0.3),
                                        width: 1),
                                    color: clickedButtonIndex == index
                                        ? bgColor
                                        : whiteBg,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                    child: MyFonts.subHeading(
                                  data: optionsMasterToOptions[index]["OPTION"]
                                      .toString(),
                                  color: darkBlack,
                                  fontweight: FontWeight.w500,
                                )),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            Container(
                child: _index == widget.question.length - 1
                    ? SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isDialogBoxOpen = true;
                            });
                            _stopAudio();
                            _timesUp(
                                "Your Scores out of ${widget.question.length * 10} is :");
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor),
                          child: MyFonts.bodyFont(
                            data: "Scores",
                            color: whiteBg,
                            fontweight: FontWeight.w500,
                          ),
                        ))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_index < widget.question.length - 1) {
                                    clickedButtonIndex = -1;
                                    setState(() {
                                      _index++;
                                      optionsMasterToOptions.clear();
                                      for (var element in optionsMasters) {
                                        if (widget.question[_index]["ID"] ==
                                            element["QUESTIONID"]) {
                                          optionsMasterToOptions.add(element);
                                        }
                                      }
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: whiteBg,
                                ),
                                child: MyFonts.bodyFont(
                                  data: "Skip",
                                  color: blackColor,
                                  fontweight: FontWeight.w500,
                                ),
                              )),
                          SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_index < widget.question.length - 1) {
                                    setState(() {
                                      _index++;
                                      clickedButtonIndex = -1;
                                      optionsMasterToOptions.clear();
                                      for (var element in optionsMasters) {
                                        if (widget.question[_index]["ID"] ==
                                            element["QUESTIONID"]) {
                                          optionsMasterToOptions.add(element);
                                        }
                                      }
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonColor),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyFonts.subHeading(
                                      data: "Next",
                                      color: whiteBg,
                                      fontweight: FontWeight.w500,
                                    ),
                                    SizedBox(width: 5,),
                                    Lottie.asset('assets/icons/next.json',height: 32)
                                  ],
                                ),
                              )),
                        ],
                      ))
          ],
        ),
      )),
    );
  }
}
