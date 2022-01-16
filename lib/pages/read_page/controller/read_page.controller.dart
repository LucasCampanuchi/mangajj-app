import 'package:dio/dio.dart';
import 'package:mangajj/api/connection/api.dart';
import 'package:mangajj/api/models/page.model.dart';
import 'package:mobx/mobx.dart';
part 'read_page.controller.g.dart';

class ReadPageController = _ReadPageControllerBase with _$ReadPageController;

abstract class _ReadPageControllerBase with Store {
  @observable
  ObservableList<Page>? pages;

  @observable
  bool isSearch = false;

  @action
  Future<void> listPages(String idManga, String idChapter) async {
    isSearch = true;
    pages = null;
    try {
      Dio dio = await ApiUtil.createDio();

      var response = await dio.get('/read/$idManga/chapter/$idChapter');

      print(response);

      if (response.statusCode == 200) {
        pages = ObservableList<Page>();
        pages!.addAll(
          List.from(response.data).map((e) => Page.fromJson(e)).toList(),
        );
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
}
