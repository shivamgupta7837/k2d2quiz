import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/view/navigation/accounts/accounts.dart';
import 'package:quiz/view/navigation/auth/login.dart';
import 'package:quiz/view/navigation/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
            const Duration(seconds: 2),
            () =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
                 "assets/images/k2d2_logo.jpg",
                  height: 230,
                ),
      //      Text("We Focuses on managing your pantry",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
  //   void whereToGo() async {
  //   bool? isLoggedIn = await  LocalStorage.instance.isUserLogin();
  //   print("is login: $isLoggedIn");
  //   print(isLoggedIn);
  //   if (isLoggedIn != null) {
  //     if (isLoggedIn == true) {
  //       Timer(
  //           const Duration(seconds: 1),
  //           () =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())));
  //     } else {
  //       Timer(
  //           const Duration(seconds: 1),
  //           () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()))
  //           );
  //     }
  //   } else {
  //     Timer(
  //         const Duration(seconds: 3),
  //         () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()))
  //             );
  //   }
  // }
}