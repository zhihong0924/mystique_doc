import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget headerlogo = Row(
  children: <Widget>[
    Container(
      //color: kBlackColor,
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      width: 45,
      height: 35,
      child: Image.asset(
        'images/logo.jpg',
        width: 45,
        height: 35,
        //scale: 3,
      ),
    ),
    Container(
      margin: EdgeInsets.only(top: 10),
      child: Text("Benchvue - Advanced Battery\nTest and Emulation",
          style: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            decoration: TextDecoration.none,
          )),
    )
  ],
);
