import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:mangajj/api/connection/api.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/api/models/page.model.dart';
import 'package:mobx/mobx.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
part 'read_page.controller.g.dart';

class ReadPageController = _ReadPageControllerBase with _$ReadPageController;

abstract class _ReadPageControllerBase with Store {
  @observable
  ObservableList<Page>? pages;

  @observable
  bool isSearch = false;

  @observable
  Chapter? chapter;

  @observable
  bool chapterReverse = false;

  @observable
  ItemScrollController itemScrollController = ItemScrollController();

  @observable
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @action
  Future<void> listPages(String idManga, Chapter c, List<Chapter> listC,
      {bool jump = true}) async {
    isSearch = true;
    pages = null;

    chapter = c;
    try {
      Dio dio = await ApiUtil.createDio();

      var response = await dio.get('/read/$idManga/chapter/' + c.id);
      if (response.statusCode == 200) {
        pages = ObservableList<Page>();
        pages!.addAll(
          List.from(response.data).map((e) => Page.fromJson(e)).toList(),
        );

        if (jump) {
          itemScrollController.scrollTo(
            index: listC.indexOf(c),
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOutCubic,
          );
        }
      } else if (response.statusCode == 404) {
        pages = ObservableList<Page>();
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

  @action
  void reverseList(List<Chapter> listC) {
    chapterReverse = !chapterReverse;
  }
}
