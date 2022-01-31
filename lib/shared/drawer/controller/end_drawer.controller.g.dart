// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_drawer.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EndDrawerController on _EndDrawerControllerBase, Store {
  final _$listAtom = Atom(name: '_EndDrawerControllerBase.list');

  @override
  ObservableList<Chapter>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Chapter>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_EndDrawerControllerBase.init');

  @override
  Future<void> init(List<Chapter> listChapters) {
    return _$initAsyncAction.run(() => super.init(listChapters));
  }

  final _$testAsyncAction = AsyncAction('_EndDrawerControllerBase.test');

  @override
  Future<void> test(BuildContext context) {
    return _$testAsyncAction.run(() => super.test(context));
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
