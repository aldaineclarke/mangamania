import 'package:flutter/material.dart';
import 'package:moviemania/screens/homeScreen.dart';
import 'package:moviemania/screens/movieScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: "Poppins",
          dividerTheme: DividerThemeData(
            color: Color(0xFF2C3F7E),
            space: 30,
            thickness: 3.0
          )
      ),
      home: const HomeScreen(),
      routes: {
        "/home": (context)=> HomeScreen(),
        "/movie": (context)=>MovieScreen(),
      },
    );
  }
}

