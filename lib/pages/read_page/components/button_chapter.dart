import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/layout/colors.dart';
import 'package:mangajj/pages/read_page/controller/read_page.controller.dart';

class ButtonChapter extends StatelessWidget {
  final Chapter chapter;
  final String idManga;
  final List<Chapter> listChapters;

  const ButtonChapter({
    Key? key,
    required this.chapter,
    required this.idManga,
    required this.listChapters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ReadPageController>();

    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => controller.listPages(
              idManga,
              chapter,
              listChapters,
              jump: false,
            ),
            child: Container(
              height: 30,
              constraints: const BoxConstraints(
                minWidth: 50,
              ),
              decoration: BoxDecoration(
                color: controller.chapter!.id == chapter.id
                    ? Colors.black
                    : Colors.white,
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
                    chapter.number,
                    style: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: controller.chapter!.id == chapter.id
                            ? Colors.white
                            : AppColors.textPrimary /* AppColors.textPrimary */,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
