import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mangajj/api/models/chapter.model.dart';
import 'package:mangajj/pages/manga_page/controller/manga_page.controller.dart';
import 'package:mobx/mobx.dart';
part 'end_drawer.controller.g.dart';

class EndDrawerController = _EndDrawerControllerBase with _$EndDrawerController;

abstract class _EndDrawerControllerBase with Store {
  final mangaController = GetIt.I.get<MangaPageController>();

  @observable
  ObservableList<Chapter>? list = ObservableList<Chapter>();

  @action
  Future<void> init(List<Chapter> listChapters) async {
    list = ObservableList<Chapter>();
    list!.addAll(listChapters);
  }

  @action
  Future<void> test(BuildContext context) async {
    list = await mangaController.setSumPageReturn(context);
  }
}
