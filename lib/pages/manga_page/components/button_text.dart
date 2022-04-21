import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangajj/pages/manga_page/controller/manga_page.controller.dart';

class ButtonText extends StatelessWidget {
  final String text;
  const ButtonText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<MangaPageController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: () => controller.setLoadMore(),
            child: Text(
              text,
              style: GoogleFonts.robotoCondensed(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              maxLines: 5,
            ),
          ),
        ),
      ],
    );
  }
}
