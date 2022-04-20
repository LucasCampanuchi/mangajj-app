import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mangajj/api/connection/api.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/api/models/page.model.dart';
import 'package:mangajj/pages/manga_page/controller/manga_page.controller.dart';
import 'package:path_provider/path_provider.dart';

import 'package:mobx/mobx.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
part 'read_page.controller.g.dart';

class ReadPageController = _ReadPageControllerBase with _$ReadPageController;

abstract class _ReadPageControllerBase with Store {
  final controller = GetIt.I.get<MangaPageController>();

  @observable
  ObservableList<PageModel>? pages;

  @observable
  ObservableList<PageModel> pagesT = ObservableList<PageModel>();

  @observable
  bool isSearch = false;

  @observable
  bool isSearchPages = false;

  @observable
  Chapter? chapter;

  @observable
  bool chapterReverse = false;

  @observable
  ItemScrollController itemScrollController = ItemScrollController();

  @observable
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @observable
  PageController pageController = PageController();

  @action
  Future<void> listPages(String idManga, Chapter c, List<Chapter> listC,
      {bool jump = true}) async {
    isSearch = true;
    pages = null;
    antP = 0;

    pagesT = ObservableList<PageModel>();

    chapter = c;
    try {
      Dio dio = await ApiUtil.createDio();

      var response = await dio.get('/read/$idManga/chapter/' + c.id);
      if (response.statusCode == 200) {
        pages = ObservableList<PageModel>();
        pages!.addAll(
          List.from(response.data).map((e) => PageModel.fromJson(e)).toList(),
        );

        if (pages!.length > 3) {
          p = 3;
        } else {
          p = pages!.length;
        }

        await savePages();

        if (pages!.isNotEmpty) {
          controller.updateList(c.id);
        }

        if (jump) {
          itemScrollController.scrollTo(
            index: listC.indexOf(c),
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOutCubic,
          );
        }
      } else if (response.statusCode == 404) {
        pages = ObservableList<PageModel>();
      } else {
        pages = null;
      }
      isSearch = false;
    } on DioError {
      isSearch = false;
    } catch (e) {
      isSearch = false;
    }
  }

  @observable
  int p = 0;

  @observable
  int antP = 0;

  Future<void> savePages() async {
    isSearchPages = true;
    Directory tempDir = await getTemporaryDirectory();
    Dio dioImage = await ApiUtil.createDioDownloadImage();

    try {
      for (int i = antP; i < p; i++) {
        await Future.delayed(const Duration(milliseconds: 500));
        Response r = await dioImage.get(
          pages![i].imageUrl,
        );

        String name = pages![i]
            .imageUrl
            .split("/")[pages![i].imageUrl.split("/").length - 1]
            .toString();
        String path = tempDir.path + name;

        File file = File(path);

        var raf = file.openSync(mode: FileMode.write);
        raf.writeFromSync(r.data);
        await raf.close();
        pages![i].imageUrl = path;

        pagesT.add(pages![i]);
      }

      antP = p;
      p += 3;
      isSearchPages = false;
    } catch (e) {
      isSearchPages = false;
    }
  }

  @action
  void reverseList(List<Chapter> listC) {
    chapterReverse = !chapterReverse;
  }

  @observable
  ScrollController scrollController = ScrollController();

  @action
  Future<void> scroll(List<Chapter> listC) async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(listC.indexOf(chapter!) * 60,
        duration: const Duration(seconds: 1), curve: Curves.easeInOutCubic);
  }
}
