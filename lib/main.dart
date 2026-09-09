import 'package:flutter/material.dart';
import 'My_Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
  debugShowCheckedModeBanner: false,

  themeMode: ThemeMode.dark,

  darkTheme: ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff0B141A),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff202C33),
      foregroundColor: Colors.white,
    ),
  ),

  home: const Myhome(),
);
  }
  }