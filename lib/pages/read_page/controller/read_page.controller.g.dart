// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_page.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReadPageController on _ReadPageControllerBase, Store {
  final _$pagesAtom = Atom(name: '_ReadPageControllerBase.pages');

  @override
  ObservableList<PageModel>? get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(ObservableList<PageModel>? value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  final _$pagesTAtom = Atom(name: '_ReadPageControllerBase.pagesT');

  @override
  ObservableList<PageModel> get pagesT {
    _$pagesTAtom.reportRead();
    return super.pagesT;
  }

  @override
  set pagesT(ObservableList<PageModel> value) {
    _$pagesTAtom.reportWrite(value, super.pagesT, () {
      super.pagesT = value;
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

  final _$isSearchPagesAtom =
      Atom(name: '_ReadPageControllerBase.isSearchPages');

  @override
  bool get isSearchPages {
    _$isSearchPagesAtom.reportRead();
    return super.isSearchPages;
  }

  @override
  set isSearchPages(bool value) {
    _$isSearchPagesAtom.reportWrite(value, super.isSearchPages, () {
      super.isSearchPages = value;
    });
  }

  final _$chapterAtom = Atom(name: '_ReadPageControllerBase.chapter');

  @override
  Chapter? get chapter {
    _$chapterAtom.reportRead();
    return super.chapter;
  }

  @override
  set chapter(Chapter? value) {
    _$chapterAtom.reportWrite(value, super.chapter, () {
      super.chapter = value;
    });
  }

  final _$chapterReverseAtom =
      Atom(name: '_ReadPageControllerBase.chapterReverse');

  @override
  bool get chapterReverse {
    _$chapterReverseAtom.reportRead();
    return super.chapterReverse;
  }

  @override
  set chapterReverse(bool value) {
    _$chapterReverseAtom.reportWrite(value, super.chapterReverse, () {
      super.chapterReverse = value;
    });
  }

  final _$itemScrollControllerAtom =
      Atom(name: '_ReadPageControllerBase.itemScrollController');

  @override
  ItemScrollController get itemScrollController {
    _$itemScrollControllerAtom.reportRead();
    return super.itemScrollController;
  }

  @override
  set itemScrollController(ItemScrollController value) {
    _$itemScrollControllerAtom.reportWrite(value, super.itemScrollController,
        () {
      super.itemScrollController = value;
    });
  }

  final _$itemPositionsListenerAtom =
      Atom(name: '_ReadPageControllerBase.itemPositionsListener');

  @override
  ItemPositionsListener get itemPositionsListener {
    _$itemPositionsListenerAtom.reportRead();
    return super.itemPositionsListener;
  }

  @override
  set itemPositionsListener(ItemPositionsListener value) {
    _$itemPositionsListenerAtom.reportWrite(value, super.itemPositionsListener,
        () {
      super.itemPositionsListener = value;
    });
  }

  final _$pageControllerAtom =
      Atom(name: '_ReadPageControllerBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  final _$pAtom = Atom(name: '_ReadPageControllerBase.p');

  @override
  int get p {
    _$pAtom.reportRead();
    return super.p;
  }

  @override
  set p(int value) {
    _$pAtom.reportWrite(value, super.p, () {
      super.p = value;
    });
  }

  final _$antPAtom = Atom(name: '_ReadPageControllerBase.antP');

  @override
  int get antP {
    _$antPAtom.reportRead();
    return super.antP;
  }

  @override
  set antP(int value) {
    _$antPAtom.reportWrite(value, super.antP, () {
      super.antP = value;
    });
  }

  final _$scrollControllerAtom =
      Atom(name: '_ReadPageControllerBase.scrollController');

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  final _$listPagesAsyncAction =
      AsyncAction('_ReadPageControllerBase.listPages');

  @override
  Future<void> listPages(String idManga, Chapter c, List<Chapter> listC,
      {bool jump = true}) {
    return _$listPagesAsyncAction
        .run(() => super.listPages(idManga, c, listC, jump: jump));
  }

  final _$scrollAsyncAction = AsyncAction('_ReadPageControllerBase.scroll');

  @override
  Future<void> scroll(List<Chapter> listC) {
    return _$scrollAsyncAction.run(() => super.scroll(listC));
  }

  final _$_ReadPageControllerBaseActionController =
      ActionController(name: '_ReadPageControllerBase');

  @override
  void reverseList(List<Chapter> listC) {
    final _$actionInfo = _$_ReadPageControllerBaseActionController.startAction(
        name: '_ReadPageControllerBase.reverseList');
    try {
      return super.reverseList(listC);
    } finally {
      _$_ReadPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pages: ${pages},
pagesT: ${pagesT},
isSearch: ${isSearch},
isSearchPages: ${isSearchPages},
chapter: ${chapter},
chapterReverse: ${chapterReverse},
itemScrollController: ${itemScrollController},
itemPositionsListener: ${itemPositionsListener},
pageController: ${pageController},
p: ${p},
antP: ${antP},
scrollController: ${scrollController}
    ''';
  }
}
