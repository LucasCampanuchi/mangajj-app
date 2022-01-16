// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_page.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReadPageController on _ReadPageControllerBase, Store {
  final _$pagesAtom = Atom(name: '_ReadPageControllerBase.pages');

  @override
  ObservableList<Page>? get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(ObservableList<Page>? value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  final _$isSearchAtom = Atom(name: '_ReadPageControllerBase.isSearch');

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

  final _$listPagesAsyncAction =
      AsyncAction('_ReadPageControllerBase.listPages');

  @override
  Future<void> listPages(String idManga, String idChapter) {
    return _$listPagesAsyncAction
        .run(() => super.listPages(idManga, idChapter));
  }

  @override
  String toString() {
    return '''
pages: ${pages},
isSearch: ${isSearch}
    ''';
  }
}
