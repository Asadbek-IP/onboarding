import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/pages/onboarding_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnboardingPage(),
    );
  }
}

