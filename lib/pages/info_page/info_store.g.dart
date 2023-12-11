// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InfoPageStore on _InfoPageStore, Store {
  late final _$isSavingAtom =
      Atom(name: '_InfoPageStore.isSaving', context: context);

  @override
  bool get isSaving {
    _$isSavingAtom.reportRead();
    return super.isSaving;
  }

  @override
  set isSaving(bool value) {
    _$isSavingAtom.reportWrite(value, super.isSaving, () {
      super.isSaving = value;
    });
  }

  late final _$loadSavedDataAsyncAction =
      AsyncAction('_InfoPageStore.loadSavedData', context: context);

  @override
  Future<void> loadSavedData() {
    return _$loadSavedDataAsyncAction.run(() => super.loadSavedData());
  }

  late final _$saveDataAsyncAction =
      AsyncAction('_InfoPageStore.saveData', context: context);

  @override
  Future<void> saveData() {
    return _$saveDataAsyncAction.run(() => super.saveData());
  }

  late final _$_InfoPageStoreActionController =
      ActionController(name: '_InfoPageStore', context: context);

  @override
  void clearFields() {
    final _$actionInfo = _$_InfoPageStoreActionController.startAction(
        name: '_InfoPageStore.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_InfoPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSaving: ${isSaving}
    ''';
  }
}
