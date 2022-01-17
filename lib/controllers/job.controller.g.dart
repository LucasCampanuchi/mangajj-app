// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$JobController on _JobControllerBase, Store {
  final _$isConnectedAtom = Atom(name: '_JobControllerBase.isConnected');

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  final _$updateStatusConnectionAsyncAction =
      AsyncAction('_JobControllerBase.updateStatusConnection');

  @override
  Future<void> updateStatusConnection() {
    return _$updateStatusConnectionAsyncAction
        .run(() => super.updateStatusConnection());
  }

  @override
  String toString() {
    return '''
isConnected: ${isConnected}
    ''';
  }
}
