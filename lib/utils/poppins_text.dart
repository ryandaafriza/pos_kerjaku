import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Poppins {
  static Text extraBold(
      {required String text,
      TextAlign? textAlign,
      TextOverflow? overflow,
      int? maxLines,
      double? fontSize,
      TextDirection? textDirection,
      Color? color}) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 14,
        color: color,
        fontWeight: FontWeight.w700,
      ),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }

  static Text bold(
      {required String text,
      TextAlign? textAlign,
      TextOverflow? overflow,
      int? maxLines,
      double? fontSize,
      TextDirection? textDirection,
      Color? color}) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 14,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }

  static Text regular(
      {required String text,
      FontWeight? fontWeight,
      TextAlign? textAlign,
      TextOverflow? overflow,
      int? maxLines,
      double? fontSize,
      TextDirection? textDirection,
      Color? color}) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 14,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }

  static Text light(
      {required String text,
      TextAlign? textAlign,
      TextOverflow? overflow,
      int? maxLines,
      double? fontSize,
      TextDirection? textDirection,
      Color? color}) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 14,
        color: color,
        fontWeight: FontWeight.w400,
      ),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }
}
