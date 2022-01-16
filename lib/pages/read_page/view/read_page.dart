import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/pages/read_page/components/button_chapter.dart';
import 'package:mangajj/pages/read_page/controller/read_page.controller.dart';
import 'package:mangajj/shared/appbar/default_appbar.dart';
import 'package:shimmer/shimmer.dart';

class ReadPage extends StatefulWidget {
  final List<Chapter> listChapters;
  final String idChapter;
  final String idManga;

  const ReadPage(
      {Key? key,
      required this.listChapters,
      required this.idChapter,
      required this.idManga})
      : super(key: key);

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  final controller = GetIt.I.get<ReadPageController>();

  @override
  void initState() {
    controller.listPages(widget.idManga, widget.idChapter);
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

    final appBar = DefaultAppBar(
      title: "Teste",
      appBar: AppBar(),
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
            Container(
              height: 60,
              color: Theme.of(context).backgroundColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  children: [
                    for (var chapter in widget.listChapters)
                      ButtonChapter(chapter: chapter, idManga: widget.idManga),
                  ],
                ),
              ),
            ),
            Observer(builder: (_) {
              if (controller.isSearch) {
                return Text('CARREGANDO');
              } else {
                if (controller.pages != null) {
                  if (controller.pages!.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('VAZIO'),
                      ],
                    );
                  } else {
                    return DefaultTabController(
                      length: controller.pages!.length,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            //Add this to give height
                            height: height,
                            child: TabBarView(children: [
                              for (var page in controller.pages!)
                                InteractiveViewer(
                                  clipBehavior: Clip.antiAlias,
                                  panEnabled: true, // Set it to false
                                  minScale: 1,
                                  maxScale: 4,
                                  child: CachedNetworkImage(
                                    imageUrl: page.imageUrl,
                                    fit: BoxFit.cover,
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
                                  ),
                                ),
                            ]),
                          ),
                        ],
                      ),
                    );
                    /* return DefaultTabController(
                      initialIndex: 0,
                      length: controller.pages!.length,
                      child: TabBarView(
                        children: <Widget>[
                          for (var page in controller.pages!)
                            InteractiveViewer(
                              clipBehavior: Clip.antiAlias,
                              panEnabled: true, // Set it to false
                              minScale: 1,
                              maxScale: 4,
                              child: CachedNetworkImage(
                                imageUrl: page.imageUrl,
                                fit: BoxFit.cover,
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
                              ),
                            ),
                        ],
                      ),
                    ); */
                  }
                  /* return Column(
                  children: [
                    SizedBox(
                      width: size.width,
                      height: 100,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          children: [
                            for (var chapter in widget.listChapters)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                ); */
                } else {
                  return Text('ERRO');
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
