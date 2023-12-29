import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primary = const Color(0xff0D529B);
LinearGradient primaryGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0, 6],
    colors: [Color(0xff004996), Color(0xff002196)]);
Color dark = const Color(0xff030E19);
Color secondary = const Color(0xffFFD02D);
Color grey = const Color(0xffA9B0B6);
Color white = const Color(0xffF9F9F9);

TextStyle darkText = GoogleFonts.poppins(color: dark);
TextStyle whiteText = GoogleFonts.poppins(color: Colors.white);
TextStyle greyText = GoogleFonts.poppins(color: grey);
TextStyle primaryText = GoogleFonts.poppins(color: primary);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extrabold = FontWeight.w900;
