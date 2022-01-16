import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/pages/read_page/controller/read_page.controller.dart';

class ButtonChapter extends StatelessWidget {
  final Chapter chapter;
  final String idManga;

  const ButtonChapter({
    Key? key,
    required this.chapter,
    required this.idManga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ReadPageController>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => controller.listPages(idManga, chapter.id),
        child: Container(
          height: 30,
          constraints: const BoxConstraints(
            minWidth: 50,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(chapter.number),
            ],
          ),
        ),
      ),
    );
  }
}
