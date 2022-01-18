import 'package:dio/dio.dart';
import 'package:mangajj/api/connection/api.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/api/models/manga.model.dart';
import 'package:mobx/mobx.dart';
part 'manga_page.controller.g.dart';

class MangaPageController = _MangaPageControllerBase with _$MangaPageController;

abstract class _MangaPageControllerBase with Store {
  @observable
  bool loadMore = false;

  @action
  void setLoadMore() {
    loadMore = !loadMore;
  }

  @observable
  ObservableList<Chapter>? listChapters;

  @observable
  bool isSearch = false;

  @action
  Future<void> list(String id) async {
    isSearch = true;

    try {
      Manga? manga;
      Dio dio = await ApiUtil.createDio();

      var response = await dio.get('manga/' + id + '?expanded_content=true');

      if (response.statusCode == 200) {
        manga = Manga.fromJson(response.data);
        listChapters = ObservableList<Chapter>();
        if (manga.chapters_list != null) {
          listChapters!.addAll(manga.chapters_list!);
        }
      } else if (response.statusCode == 404) {
        listChapters = ObservableList<Chapter>();
      }

      isSearch = false;
      // ignore: unused_catch_clause
    } on DioError catch (dioError) {
      isSearch = false;
    } catch (e) {
      isSearch = false;
    }
  }
}
