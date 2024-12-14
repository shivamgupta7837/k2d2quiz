import 'package:flutter/material.dart';

import '../fonts.dart';

class CustomWidget {
  static  AppBar buildAppBar(
      {
        bool needLeading=true,
        required BuildContext context,
        required Color appBarColor,
        required String title,
        required Color textColor,bool titleCenter = true,double size = 14,fontWeight = FontWeight.w500,leadingNeeded = true,leadingColor=Colors.white,double elevation = 0}) {
    return AppBar(
      automaticallyImplyLeading: needLeading,
      elevation: elevation,
      leading:leadingNeeded==true ? IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon:  Icon(
        Icons.arrow_circle_left_outlined,
        size: 28,
        color: leadingColor,
      ),):null,
      centerTitle: titleCenter,
      backgroundColor: appBarColor,
      title: MyFonts.bodyFont(
          data: title,
          color: textColor,
          size: size,
          fontweight: fontWeight),
    );
}
}
