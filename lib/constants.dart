import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kGrey1 = Color(0XFF9F9F9F);
const Color kGrey2 = Color(0xFF6D6D6D);
const Color kGrey3 = Color(0XFFEAEAEA);
const Color kBlack = Color(0xFF1C1C1C);

var kNonActiveTabStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey1,
  ),
);

var kActiveTabStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 16.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);

var kCategoryTitle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey2,
    fontWeight: FontWeight.bold,
  ),
);

var kDetailContent = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey2,
  ),
);

var kTitleCard = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 18.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);
