import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static const letterSpacing = null;

  static TextStyle title(Color color) {
    return GoogleFonts.sourceCodePro(
      fontSize: 64,
      fontWeight: FontWeight.w800,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle bioDescriptionStyle(Color color) {
    return GoogleFonts.sourceCodePro(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle body(Color color) {
    return GoogleFonts.sourceCodePro(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle subtext(Color color) {
    return GoogleFonts.sourceCodePro(
      fontSize: 12,
      fontWeight: FontWeight.w100,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle headingMedium(Color color) {
    return GoogleFonts.sourceCodePro(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle titleSmallBold(Color color) {
    return GoogleFonts.sourceCodePro(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle titleBold(Color color) {
    return GoogleFonts.sourceCodePro(
      fontSize: 48,
      fontWeight: FontWeight.w900,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle titleLight(Color color) {
    return GoogleFonts.sourceCodePro(
      fontSize: 36,
      fontWeight: FontWeight.w300,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle titleLarge(Color color) {
    return GoogleFonts.sourceCodePro(
      fontSize: 72,
      fontWeight: FontWeight.w100,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle tapBar(Color color) {
    return GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w200,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle description(Color color) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
      letterSpacing: letterSpacing,
    );
  }
}
