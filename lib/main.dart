import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/view/navigation/home.dart';
import 'package:quiz/view/navigation/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A Demo Quiz app for Students',
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}
