import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mangajj/api/connection/api.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/api/models/manga.model.dart';
import 'package:mangajj/shared/message/message.dart';
import 'package:mobx/mobx.dart';
part 'manga_page.controller.g.dart';

class MangaPageController = _MangaPageControllerBase with _$MangaPageController;

abstract class _MangaPageControllerBase with Store {
  @observable
  bool loadMore = false;

  @observable
  ObservableList<Chapter>? listChapters = ObservableList<Chapter>();

  @observable
  bool isSearch = false;

  @observable
  int page = 0;

  @observable
  String idManga = '';

  @action
  void setLoadMore() {
    loadMore = !loadMore;
  }

  @action
  void setSumPage(String id, BuildContext context) {
    page++;
    list(id, context);
  }

  @action
  Future<ObservableList<Chapter>?> setSumPageReturn(
      BuildContext context) async {
    page++;
    await list(idManga, context);

    return listChapters;
  }

  @action
  Future<void> list(String id, BuildContext context) async {
    isSearch = true;

    idManga = id;

    try {
      Manga? manga;
      Dio dio = await ApiUtil.createDio();

      var response = await dio.get('manga/' +
          id +
          '?expanded_content=true&chapters_page=' +
          page.toString());

      if (response.statusCode == 200) {
        manga = Manga.fromJson(response.data);

        if (manga.chapters_list != null) {
          listChapters!.addAll(manga.chapters_list!.data!);
        }
      } else if (response.statusCode == 404) {
        listChapters = ObservableList<Chapter>();
      }

      isSearch = false;
    } on DioError catch (error) {
      message(context, error.message);
      isSearch = false;
    } catch (e) {
      isSearch = false;
    }
  }

  @action
  void updateList(String idChapter) {
    if (listChapters != null) {
      for (var chapter in listChapters!) {
        if (chapter.id == idChapter) {
          print(chapter.status);
          chapter.status = 'Done';
          print('aw' + chapter.status);
        }
      }
    }
    listChapters = listChapters;
  }
}
