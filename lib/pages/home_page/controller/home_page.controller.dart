import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mangajj/api/connection/api.dart';
import 'package:mangajj/api/connection/exceptions.dart';
import 'package:mangajj/api/models/manga.model.dart';
import 'package:mangajj/shared/message/message.dart';
import 'package:mobx/mobx.dart';
part 'home_page.controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  @observable
  Observable<TextEditingController> searchText =
      Observable<TextEditingController>(TextEditingController());

  @observable
  String? text = '';

  @observable
  ObservableList<Manga>? listManga = ObservableList<Manga>();

  @observable
  bool isSearch = false;

  @observable
  bool notSearch = true;

  @observable
  int page = 0;

  @observable
  int lastPage = 0;

  @action
  void setSearchText(String? t) {
    text = t;
  }

  @action
  void searchByText(String t) {
    page = 0;
    listManga = ObservableList<Manga>();
    search();
  }

  @action
  void setSumPage(BuildContext context) {
    if (page < lastPage - 1) {
      page++;
      search(context: context);
    } else {
      message(context, "Última Página");
    }
  }

  @action
  Future<void> search({BuildContext? context}) async {
    isSearch = true;
    notSearch = false;

    try {
      Dio dio = await ApiUtil.createDio();

      print('manga?page=' +
          page.toString() +
          '&limit=10&title=' +
          searchText.value.text);

      var response = await dio.get(
        'manga/?page=' +
            page.toString() +
            '&limit=10&title=' +
            searchText.value.text,
      );

      if (response.statusCode == 200) {
        List<Manga> temporaryList = List.from(response.data['data'])
            .map((e) => Manga.fromJson(e))
            .toList();

        bool contains = false;
        for (var manga in temporaryList) {
          contains = false;
          for (var m in listManga!) {
            if (manga.id == m.id) {
              contains = true;
            }
          }
          if (!contains) {
            listManga!.add(manga);
          }
        }

        lastPage = response.data['last_page'];
      } else if (response.statusCode == 404) {
        listManga = ObservableList<Manga>();
      }

      isSearch = false;
    } on DioError catch (dioError) {
      isSearch = false;
      if (context != null) {
        message(context, DioExceptions.fromDioError(dioError).toString());
      }
    } catch (e) {
      isSearch = false;
    }
  }
}
