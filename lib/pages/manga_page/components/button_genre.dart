import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonGenre extends StatelessWidget {
  final String genre;

  const ButtonGenre({
    Key? key,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 35,
        constraints: const BoxConstraints(
          minWidth: 90,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              genre,
              style: GoogleFonts.robotoCondensed(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
