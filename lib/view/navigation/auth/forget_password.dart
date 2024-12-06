import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/constants/alignments.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/fonts.dart';
import 'package:quiz/constants/widgets/customWidget.dart';
import 'package:quiz/view/navigation/auth/signup.dart';
import 'package:quiz/view/navigation/accounts/accounts.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {


  final _resetPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isPasswordProtected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget.buildAppBar(appBarColor:  Color(0xff3f3d55), title: "Reset Password", textColor: Colors.white,size: 18,fontWeight: FontWeight.w600,leadingNeeded: true,context: context),
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
                  "assets/animations/reset_passwords.json",
                  height: 280,
                ),
                const SizedBox(
                  height: 20,
                ),
                inputForms(),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(backgroundColor: Color(0xff3f3d55)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Accounts()));
                          }
                        },
                        child: isLoading == false
                            ? Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                            : const CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                          strokeWidth: 3.0,
                        )),
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
              } else {
                return null;
              }
            },
            controller: _phoneNumberController,
            decoration: InputDecoration(
                label:  MyFonts.bodyFont(data: "Enter Phone Number",color: Colors.grey.shade600,fontweight: FontWeight.w500),
                prefixIcon: Icon(Icons.phone),
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
                hintText: "Example: 9872657463"),
          ),

          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field cannot be empty";
                  } else {
                    return null;
                  }
                },
                obscureText: isPasswordProtected == true ? true : false,
                controller: _resetPasswordController,
                decoration: InputDecoration(
                    isDense: true,
                    label:  MyFonts.bodyFont(data: "Enter Password",color: Colors.grey.shade600,fontweight: FontWeight.w500),
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
        ],
      ),
    );
  }
}
