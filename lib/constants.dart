import 'package:flutter/material.dart';

const kBlackColor = Color(0xff000000);
const kUpperNavbar = Color(0xffFCFAFA);
const kContentColor = Color(0xffF8F8F8);
const kLinkTextColor = Color(0xffB51532);

// TextField dedign
final kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

final kDefaultOutlineInputBorder = OutlineInputBorder(
  // Maybe flutter team need to fix it on web
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xff000000),
  ),
);
