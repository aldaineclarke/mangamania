import 'package:flutter/material.dart';
import 'package:moviemania/widgets/widgets.dart';
import '../utilities/colors.dart';
class PageWithDrawer extends StatelessWidget {
  const PageWithDrawer({
    Key? key,
    required this.body,
  }) : super(key: key);

  final body;

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
      body: body,
      drawer: SafeArea(

        child: DrawerNavigation(),
      ),
    );
  }
}
