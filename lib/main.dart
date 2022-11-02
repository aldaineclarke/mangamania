import 'package:flutter/material.dart';
import 'package:moviemania/screens/homeScreen.dart';
import 'package:moviemania/screens/movieScreen.dart';
import 'package:moviemania/utilities/colors.dart';

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
      initialRoute: "/home",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: AppColors.textColor,
          primarySwatch: Colors.indigo,
          textTheme: TextTheme(
              headline6: TextStyle(color:AppColors.textColor, fontSize: 16)
          ),
          fontFamily: "Poppins",
          dividerTheme: DividerThemeData(
            color: AppColors.primaryColor,
            space: 30,
            thickness: 3.0
          )
      ),
      routes: {
        "/home": (context)=> const HomeScreen(),
        "/movie": (context)=> const MovieScreen(),
      },
    );
  }
}

