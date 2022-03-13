import 'package:flutter/material.dart';
import 'package:flutter_festival/screens/landing.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
          colorScheme: const ColorScheme.light(primary: Color(0xffd76542))),
      home: const Scaffold(
        body: Center(
          child: Landing(),
        ),
      ),
    );
  }
}
