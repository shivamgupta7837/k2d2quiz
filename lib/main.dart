import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/test_audio.dart';
import 'package:quiz/view/navigation/accounts/add_Accounts.dart';
import 'package:quiz/view/navigation/auth/login.dart';
import 'package:quiz/view/navigation/home.dart';
import 'package:quiz/view/navigation/navigation.dart';
import 'package:quiz/view/navigation/splash_Screen.dart';
import 'package:quiz/view/navigation/accounts/accounts.dart';
import 'package:quiz/view_model/add_user_provider.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
  ));

  // Use this when app is live in app store.
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddUserProvider(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'A Quiz app for Students',

        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home:Accounts(),
      ),
    );
  }
}

