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
  TextEditingController searchText = TextEditingController();

  @observable
  List<Manga>? listManga;

  @observable
  bool isSearch = false;

  @observable
  bool notSearch = true;

  @action
  void setSearchText(String value) {
    search();
  }

  @action
  Future<void> search({BuildContext? context}) async {
    isSearch = true;
    notSearch = false;

    try {
      Dio dio = await ApiUtil.createDio();

      var response = await dio.get('manga?title=' + searchText.text);

      if (response.statusCode == 200) {
        listManga =
            List.from(response.data).map((e) => Manga.fromJson(e)).toList();
      } else if (response.statusCode == 404) {
        listManga = [];
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
