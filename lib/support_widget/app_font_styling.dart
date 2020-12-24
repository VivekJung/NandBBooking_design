import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

fontStyle(
  double size, [
  Color color,
  FontWeight fontWeight,
  FontStyle fontStyle,
]) {
  return GoogleFonts.openSans(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}
