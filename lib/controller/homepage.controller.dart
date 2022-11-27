import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/domain/model/task.model.dart';
part 'homepage.controller.g.dart';

class HomePageController = HomePageControllerBase with _$HomePageController;

abstract class HomePageControllerBase with Store {
  ObservableList<Task> taskList = ObservableList();

  TextEditingController textEditingController = TextEditingController();

  @action
  void resolveTask(Task task) {
    task.setIsResolved();
  }

  @action
  void add(String title) {
    taskList.add(
      Task(title: title),
    );
  }

  @action
  void clear() {
    taskList.clear();
  }
}
