import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/pages/read_page/components/button_chapter.dart';
import 'package:mangajj/pages/read_page/components/reload.dart';
import 'package:mangajj/pages/read_page/controller/read_page.controller.dart';
import 'package:mangajj/shared/text/text.dart';
import 'package:shimmer/shimmer.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15.0,
          ),
          child: Observer(builder: (_) {
            return InkWell(
              onTap: () => controller.reverseList(widget.listChapters),
              child: controller.chapterReverse
                  ? const Icon(
                      Icons.arrow_forward,
                    )
                  : const Icon(
                      Icons.arrow_back,
                    ),
            );
          }),
        )
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
      body: SizedBox(
        width: size.width,
        child: Column(
          children: [
            Observer(builder: (_) {
              return Container(
                height: 60,
                color: Theme.of(context).backgroundColor,
                child: controller.chapterReverse
                    ? ScrollablePositionedList.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.listChapters.length,
                        itemBuilder: (context, index) => ButtonChapter(
                          chapter: widget.listChapters[index],
                          idManga: widget.idManga,
                          listChapters: widget.listChapters,
                        ),
                        itemScrollController: controller.itemScrollController,
                        itemPositionsListener: controller.itemPositionsListener,
                      )
                    : ScrollablePositionedList.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.listChapters.length,
                        itemBuilder: (context, index) => ButtonChapter(
                          chapter: widget.listChapters[
                              (widget.listChapters.length - 1) - index],
                          idManga: widget.idManga,
                          listChapters: widget.listChapters,
                        ),
                        itemScrollController: controller.itemScrollController,
                        itemPositionsListener: controller.itemPositionsListener,
                      ),
              );
            }),
            Observer(builder: (_) {
              if (controller.isSearch) {
                return SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Colors.black,
                      ),
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
                    return DefaultTabController(
                      initialIndex: controller.pages!.length - 1,
                      length: controller.pages!.length,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            //Add this to give height
                            height: height,
                            child: TabBarView(
                              children: [
                                for (var page in controller.pages!.reversed)
                                  InteractiveViewer(
                                      clipBehavior: Clip.antiAlias,
                                      panEnabled: true, // Set it to false
                                      minScale: 1,
                                      maxScale: 4,
                                      child: CachedNetworkImage(
                                        imageUrl: page.imageUrl,
                                        fit: BoxFit.fitWidth,
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          child: SizedBox(
                                            width: size.width,
                                            height: size.height * 0.6,
                                          ),
                                          baseColor: Colors.black12,
                                          highlightColor: Colors.black26,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      )),
                              ],
                            ),
                          ),
                        ],
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
