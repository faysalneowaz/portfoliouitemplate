import 'package:flutter/material.dart';
import 'package:learning/pages/home_page.dart';
import 'package:learning/styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kCustomTheme,
      title: 'Faysal Neowaz',
      home: const HomePage(),
    );
  }
}
