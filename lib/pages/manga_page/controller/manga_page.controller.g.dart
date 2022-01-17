// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_page.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MangaPageController on _MangaPageControllerBase, Store {
  final _$loadMoreAtom = Atom(name: '_MangaPageControllerBase.loadMore');

  @override
  bool get loadMore {
    _$loadMoreAtom.reportRead();
    return super.loadMore;
  }

  @override
  set loadMore(bool value) {
    _$loadMoreAtom.reportWrite(value, super.loadMore, () {
      super.loadMore = value;
    });
  }

  final _$listChaptersAtom =
      Atom(name: '_MangaPageControllerBase.listChapters');

  @override
  ObservableList<Chapter>? get listChapters {
    _$listChaptersAtom.reportRead();
    return super.listChapters;
  }

  @override
  set listChapters(ObservableList<Chapter>? value) {
    _$listChaptersAtom.reportWrite(value, super.listChapters, () {
      super.listChapters = value;
    });
  }

  final _$isSearchAtom = Atom(name: '_MangaPageControllerBase.isSearch');

  @override
  bool get isSearch {
    _$isSearchAtom.reportRead();
    return super.isSearch;
  }

  @override
  set isSearch(bool value) {
    _$isSearchAtom.reportWrite(value, super.isSearch, () {
      super.isSearch = value;
    });
  }

  final _$listAsyncAction = AsyncAction('_MangaPageControllerBase.list');

  @override
  Future<void> list(String id) {
    return _$listAsyncAction.run(() => super.list(id));
  }

  final _$_MangaPageControllerBaseActionController =
      ActionController(name: '_MangaPageControllerBase');

  @override
  void setLoadMore() {
    final _$actionInfo = _$_MangaPageControllerBaseActionController.startAction(
        name: '_MangaPageControllerBase.setLoadMore');
    try {
      return super.setLoadMore();
    } finally {
      _$_MangaPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadMore: ${loadMore},
listChapters: ${listChapters},
isSearch: ${isSearch}
    ''';
  }
}
