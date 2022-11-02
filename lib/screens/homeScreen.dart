import 'package:flutter/material.dart';
import 'package:moviemania/utilities/colors.dart';
import 'package:moviemania/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(

        ),
        body: Center(child:Container()),
        drawer: SafeArea(

          child: DrawerNavigation(),
        ),
    );
  }


}



