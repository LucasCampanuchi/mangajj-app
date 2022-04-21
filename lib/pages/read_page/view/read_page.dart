import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/pages/read_page/components/reload.dart';
import 'package:mangajj/pages/read_page/controller/read_page.controller.dart';
import 'package:mangajj/shared/drawer/end_drawer.dart';
import 'package:mangajj/shared/text/text.dart';

class ReadPage extends StatefulWidget {
  final List<Chapter> listChapters;
  final Chapter chapter;
  final String idManga;

  const ReadPage(
      {Key? key,
      required this.listChapters,
      required this.chapter,
      required this.idManga})
      : super(key: key);

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  final itemKey = GlobalKey(debugLabel: '');

  Future scroolTo() async {
    final context = itemKey.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  final controller = GetIt.I.get<ReadPageController>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  void initState() {
    controller.chapterReverse = true;
    controller.listPages(widget.idManga, widget.chapter, widget.listChapters);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    //controller.loadMore = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final appBar = AppBar(
      title: Observer(
        builder: (_) {
          return controller.chapter != null
              ? DefaultText(
                  text: '#Capítulo ' + controller.chapter!.number,
                )
              : DefaultText(
                  text: '#Capítulo ' + widget.chapter.number,
                );
        },
      ),
      leading: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
      actions: [
        InkWell(
          onTap: () => _openEndDrawer(),
          child: const SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              Icons.menu,
            ),
          ),
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
    );

    final height = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        60;

    return Scaffold(
      appBar: appBar,
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: ReadDrawer(
        listChapters: widget.listChapters,
        idManga: widget.idManga,
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          children: [
            Observer(builder: (_) {
              if (controller.isSearch) {
                return SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              } else {
                if (controller.pages != null) {
                  if (controller.pages!.isEmpty) {
                    return Reload(
                      text: 'Processando seu capítulo, puxe para atualizar',
                      height: height,
                      onRefresh: () async => controller.listPages(
                        widget.idManga,
                        controller.chapter!,
                        widget.listChapters,
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                      color: Colors.black,
                      onRefresh: () async => controller.listPages(
                        widget.idManga,
                        controller.chapter!,
                        widget.listChapters,
                      ),
                      child: SizedBox(
                        height: height,
                        child: ListView.builder(
                          itemBuilder: (ctx, idx) {
                            return SizedBox(
                              height: height,
                              child: PageView(
                                onPageChanged: (value) {
                                  if (value == controller.antP - 2) {
                                    controller.savePages();
                                  }
                                },
                                reverse: true,
                                controller: controller.pageController,
                                children: <Widget>[
                                  for (var page in controller.pagesT)
                                    InteractiveViewer(
                                      clipBehavior: Clip.antiAlias,
                                      panEnabled: true, // Set it to false
                                      minScale: 1,
                                      maxScale: 4,
                                      child: Image.file(File(page.imageUrl)),
                                    ),
                                  if (controller.isSearchPages)
                                    SizedBox(
                                      height: height,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          CircularProgressIndicator(
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            );
                          },
                          itemCount: 1,
                        ),
                      ),
                    );
                  }
                } else {
                  return Reload(
                    text: 'Erro ao carregar, puxe para atualizar',
                    height: height,
                    onRefresh: () async => controller.listPages(
                      widget.idManga,
                      controller.chapter!,
                      widget.listChapters,
                    ),
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
