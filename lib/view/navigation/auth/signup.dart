import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/fonts.dart';
import 'package:quiz/view/navigation/auth/signup.dart';

import '../../../constants/widgets/customWidget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isPasswordProtected = true;
  bool isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomWidget.buildAppBar(appBarColor: Color(0xff4a6cd0), title: "Signup", textColor: Colors.white,size: 18,fontWeight: FontWeight.w600,leadingNeeded: true,context: context),

      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(screenPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  "assets/animations/signup.json",
                  height: 280,
                ),
                const SizedBox(
                  height: 50,
                ),
                inputForms(),
                const SizedBox(
                  height: 50,),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(backgroundColor:  Color(0xff4a6cd0)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            print("Navigating");
                          }
                        },
                        child: Text(
                          "Signup",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )),
                  )
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.09,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyFonts.subHeading(data: "Already have an account ?",color: blackColor,size: 14),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: MyFonts.subHeading(
                              data: "Login here",
                              color:  Color(0xff4a6cd0),
                              size: 14,fontweight: FontWeight.w700)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form inputForms() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "This field cannot be empty";
              } else if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return "Please enter a valid email address";
              } else {
                return null;
              }
            },
            controller: _emailController,
            decoration: InputDecoration(
                label:  MyFonts.bodyFont(data: "Enter Email",color: Colors.grey.shade600,fontweight: FontWeight.w500),
                prefixIcon: Icon(Icons.email),
                isDense: true,
                hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Example: abc@gmail.com"),
          ),
          const SizedBox(height: 20),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "This field cannot be empty";
              } else {
                return null;
              }
            },
            controller: _phoneNumberController,
            decoration: InputDecoration(
                label:  MyFonts.bodyFont(data: "Enter Phone Number",color: Colors.grey.shade600,fontweight: FontWeight.w500),
                prefixIcon:const Icon(Icons.phone),
                isDense: true,
                hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Example: 9872341982"),
          ),

          const SizedBox(height: 20),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "This field cannot be empty";
              } else {
                return null;
              }
            },
            obscureText: isPasswordProtected == true ? true : false,
            controller: _passwordController,
            decoration: InputDecoration(
                isDense: true,

                label:  MyFonts.bodyFont(data: "Enter new Password",color: Colors.grey.shade600,fontweight: FontWeight.w500),
                prefixIcon: Icon(Icons.password),
                hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: isPasswordProtected == true
                    ? IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordProtected = false;
                      });
                    },
                    icon: const Icon(
                      Icons.lock_open_rounded,
                      color: buttonColor,
                      size: 19,
                    ))
                    : IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordProtected = true;
                      });
                    },
                    icon: const Icon(
                      Icons.lock,
                      color: buttonColor,
                      size: 19,
                    )),
                hintText: "Example: hfaiur374q"),
          ),
        ],
      ),
    );
  }
}
