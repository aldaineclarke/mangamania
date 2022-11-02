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
          iconTheme: IconThemeData(color : AppColors.titleColor, size: 30),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Image(image:AssetImage("assets/moviemania_logo.png"), height: 30.0,),
          actions: [
            TextButton(
              onPressed: (){},
              child: Icon(Icons.search_rounded, size: 30.0, color:AppColors.titleColor)
            )
          ],
        ),
        body: Center(child:Container()),
        drawer: SafeArea(

          child: DrawerNavigation(),
        ),
    );
  }


}



