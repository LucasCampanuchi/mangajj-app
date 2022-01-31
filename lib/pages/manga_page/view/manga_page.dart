import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/api/models/manga.model.dart';
import 'package:mangajj/layout/colors.dart';
import 'package:mangajj/pages/manga_page/components/button_genre.dart';
import 'package:mangajj/pages/manga_page/components/button_text.dart';
import 'package:mangajj/pages/manga_page/components/card.dart';
import 'package:mangajj/pages/manga_page/components/skeleton_card.dart';
import 'package:mangajj/pages/manga_page/controller/manga_page.controller.dart';

import 'package:mangajj/shared/appbar/default_appbar.dart';
import 'package:mangajj/shared/text/text.dart';
import 'package:mobx/mobx.dart';

class MangaPage extends StatefulWidget {
  final Manga manga;
  const MangaPage({
    Key? key,
    required this.manga,
  }) : super(key: key);

  @override
  State<MangaPage> createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage> {
  ScrollController scrollController = ScrollController();
  final controller = GetIt.I.get<MangaPageController>();

  @override
  void initState() {
    controller.page = 0;
    controller.listChapters = ObservableList<Chapter>();
    controller.list(widget.manga.id.toString(), context);
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        controller.setSumPage(
          widget.manga.id.toString(),
          context,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.loadMore = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: DefaultAppBar(
        title: widget.manga.title ?? '',
        appBar: AppBar(),
      ),
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: () async {
          controller.page = 0;
          controller.listChapters = ObservableList<Chapter>();
          controller.list(widget.manga.id.toString(), context);
        },
        child: ListView.builder(
          controller: scrollController,
          itemBuilder: (ctx, idx) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.4,
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        'imagepage',
                        arguments: {'manga': widget.manga},
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.manga.imageUrl ?? '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 18.0, left: 26.0, right: 26.0),
                    child: Observer(
                      builder: (_) {
                        if (controller.loadMore) {
                          return Column(
                            children: [
                              DefaultText(
                                fontSize: 20,
                                text: widget.manga.synopsis ?? '',
                              ),
                              const ButtonText(
                                text: 'ver menos',
                              )
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              Text(
                                widget.manga.synopsis ?? '',
                                style: GoogleFonts.robotoCondensed(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textPrimary,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                maxLines: 5,
                              ),
                              if (widget.manga.synopsis != null)
                                const ButtonText(
                                  text: 'ver mais',
                                )
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  Wrap(
                    children: [
                      if (widget.manga.genres != null)
                        for (var genre in widget.manga.genres!)
                          ButtonGenre(genre: genre),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(26.0),
                        child: DefaultText(
                          text: 'Capítulos',
                        ),
                      ),
                    ],
                  ),
                  Observer(
                    builder: (_) {
                      if (controller.listChapters != null) {
                        if (controller.listChapters!.isEmpty &&
                            !controller.isSearch) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: DefaultText(
                              text: 'Nenhum capítulo encontrado',
                            ),
                          );
                        } else {
                          return Wrap(
                            children: [
                              for (var chapter in controller.listChapters!)
                                CardChapter(
                                  chapter: chapter,
                                  urlImage: widget.manga.imageUrl ?? '',
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    'readpage',
                                    arguments: {
                                      'listChapters': controller.listChapters,
                                      'chapter': chapter,
                                      'idManga': widget.manga.id.toString(),
                                    },
                                  ),
                                ),
                            ],
                          );
                        }
                      } else {
                        return const Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: DefaultText(
                            text: 'Erro ao buscar capítulos',
                          ),
                        );
                      }
                    },
                  ),
                  Observer(builder: (_) {
                    return Column(
                      children: [
                        if (controller.isSearch)
                          Wrap(
                            children: [
                              for (var i = 0; i < 6; i++)
                                const SkeletonCardChapter(),
                            ],
                          )
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 30,
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
}
