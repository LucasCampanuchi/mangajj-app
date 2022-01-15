import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void message(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: GoogleFonts.robotoCondensed(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
