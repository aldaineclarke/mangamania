import 'package:flutter/material.dart';

import '../utilities/colors.dart';
class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    this.text: "Play Now",
    this.background: Colors.transparent

  }) : super(key: key);
  final text;
  final background;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: background,

          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            // side:
          ),

          side: BorderSide( width: 2.0, color: AppColors.textColor, style: BorderStyle.solid),
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),

        ),
        onPressed: ()=> null,
        child: Row(
          children: [
            Icon(Icons.play_arrow, color: AppColors.textColor,size: 20),
            Text(
              text,
              style: TextStyle(fontSize: 12, color: AppColors.textColor, fontWeight: FontWeight.bold),
            )
          ],
        )
    );
  }
}
