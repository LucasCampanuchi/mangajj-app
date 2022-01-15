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
}
