import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFonts {

  static Widget subHeading({required String data,Color color = Colors.black,double size = 17 ,bool needUpperCase = false, FontWeight fontweight = FontWeight.w500 }){
    return Text(needUpperCase?data.toUpperCase():data,style: GoogleFonts.poppins(fontWeight:fontweight  ,fontSize: size,color: color),);
  }
  static Widget bodyFont( {required String data,Color color = Colors.black,double size = 14,FontWeight fontweight = FontWeight.w300}){
    return Text(data,style: GoogleFonts.poppins(fontWeight:  fontweight,fontSize: size,color: color),);
  }
  static Widget heading({required String data,Color color = Colors.black,double size = 21 ,bool needUpperCase = false,FontWeight fontweight = FontWeight.w600 }){
    return Text(needUpperCase?data.toUpperCase():data,style: GoogleFonts.poppins(fontWeight:  fontweight,fontSize: size,color: color),);
  }
}
