import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/pages/read_page/components/button_chapter.dart';
import 'package:mangajj/pages/read_page/controller/read_page.controller.dart';

import 'controller/end_drawer.controller.dart';

class ReadDrawer extends StatefulWidget {
  final List<Chapter> listChapters;
  final String idManga;

  const ReadDrawer({
    Key? key,
    required this.listChapters,
    required this.idManga,
  }) : super(key: key);

  @override
  State<ReadDrawer> createState() => _ReadDrawerState();
}

class _ReadDrawerState extends State<ReadDrawer> {
  final controller = GetIt.I.get<ReadPageController>();
  final endDrawerController = GetIt.I.get<EndDrawerController>();

  @override
  void initState() {
    endDrawerController.init(widget.listChapters);

    controller.scrollController.addListener(() async {
      if (controller.scrollController.position.pixels ==
          controller.scrollController.position.maxScrollExtent) {
        endDrawerController.test(context);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    controller.scroll(widget.listChapters);

    return Drawer(
      child: SizedBox(
        width: size.width,
        height: 500,
        child: Observer(builder: (_) {
          return Container(
            padding: const EdgeInsets.only(top: 100),
            height: 60,
            width: 500,
            color: Theme.of(context).backgroundColor,
            child: ListView.builder(
              controller: controller.scrollController,
              itemBuilder: (ctx, index) => ButtonChapter(
                chapter: endDrawerController.list![index],
                idManga: widget.idManga,
                listChapters: endDrawerController.list!,
              ),
              itemCount: endDrawerController.list!.length,
            ),
          );
        }),
      ),
    );
  }
}
