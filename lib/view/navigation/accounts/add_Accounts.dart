import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/fonts.dart';

import '../../../constants/colors.dart';
import '../../../constants/widgets/customWidget.dart';

enum Gender { Male, Female }

class AddAccounts extends StatefulWidget {
  AddAccounts({super.key});

  @override
  State<AddAccounts> createState() => _AddAccountsState();
}

class _AddAccountsState extends State<AddAccounts> {
  final _formKey = GlobalKey<FormState>();
  Gender _selectedGender = Gender.Male;
  File? image;

  final studentNameController = TextEditingController();
  final classController = TextEditingController();
  final ageController = TextEditingController();
  final schoolNameController = TextEditingController();
  String studentGender = "";

   Future pickImage() async {
                        try {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (image == null) return;
                          final imageTemp = File(image.path);
                          setState(() => this.image = imageTemp);
                        } on PlatformException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to pick image:')));
                          print('Failed to pick image: $e');
                        }
                      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomWidget.buildAppBar(
          appBarColor: buttonColor,
          title: "Add Account",
          textColor: Colors.white,
          size: 18,
          fontWeight: FontWeight.w500,
          leadingNeeded: true,
          leadingColor: Colors.white,
          context: context),
      body: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                     print("Image Selected $image");
                     pickImage();
                     print("Image Selected $image");
                    },
                    child:image==null? CircleAvatar(
                      radius: 50,
                      backgroundColor: buttonColor,
                      child: Icon(
                        Icons.person_add_rounded,
                        size: 50,
                        color: Colors.white,
                      )
                    ):ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
                      child: ClipOval(
                          child: Image.memory(
                            image!.readAsBytesSync(),),
                        ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: studentNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        icon: Image.asset(
                          "assets/icons/student.png",
                          height: 25,
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        label: MyFonts.bodyFont(
                            fontweight: FontWeight.w400,
                            data: "Enter Student Name")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: classController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Image.asset(
                          "assets/icons/class.png",
                          height: 25,
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        label: MyFonts.bodyFont(
                            fontweight: FontWeight.w400, data: "Enter Class")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Image.asset(
                          "assets/icons/age.png",
                          height: 25,
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        label: MyFonts.bodyFont(
                            fontweight: FontWeight.w400, data: "Age")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: schoolNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        icon: Image.asset(
                          "assets/icons/school.png",
                          height: 25,
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        label: MyFonts.bodyFont(
                            fontweight: FontWeight.w400, data: "School Name")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/icons/gender.png",
                        height: 25,
                      ),
                      Radio<Gender>(
                        groupValue: _selectedGender,
                        value: Gender.Male,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            setState(() {
                              _selectedGender = value!;
                              studentGender = value.toString();
                            });
                          });
                        },
                      ),
                      MyFonts.bodyFont(
                          data: "Male", fontweight: FontWeight.w500),
                      SizedBox(
                        width: 20,
                      ),
                      Radio(
                        value: Gender.Female,
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            _selectedGender = value!;
                            studentGender = value.toString();
                          });
                        },
                      ),
                      MyFonts.bodyFont(
                          data: "Female", fontweight: FontWeight.w500)
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {}
                          },
                          child: Text(
                            "Add",
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
          ),
        ),
      ),
    );
  }
}
