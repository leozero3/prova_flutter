import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'info_store.g.dart';

class InfoPageStore = _InfoPageStore with _$InfoPageStore;

abstract class _InfoPageStore with Store {
  final titleController = TextEditingController();
  final textController = TextEditingController();

  @observable
  bool isSaving = false;

  @action
  Future<void> loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    titleController.text = prefs.getString('titulo') ?? '';
    textController.text = prefs.getString('texto') ?? '';
  }

  @action
  Future<void> saveData() async {
    if (titleController.text.isNotEmpty && textController.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('titulo', titleController.text);
      prefs.setString('texto', textController.text);
      isSaving = false;
    } else {
      return;
    }
  }

  @action
  void clearFields() {
    titleController.text = '';
    textController.text = '';
  }

  void dispose() {
    titleController.dispose();
    textController.dispose();
  }
}
