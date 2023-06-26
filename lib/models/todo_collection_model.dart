import 'package:flutter/material.dart';

class TodoCollectionModel {
  final String title;
  final IconData iconData;
  final List<Color> gradientColors;
  final List<dynamic> listOfTasks;

  TodoCollectionModel({
    required this.listOfTasks,
    required this.title,
    required this.iconData,
    required this.gradientColors,
  });
}

class TaskModel {
  final String title;
  final bool isDone;

  TaskModel({
    required this.isDone,
    required this.title,
  });
}

List<TodoCollectionModel> fakeData = [
  TodoCollectionModel(
    title: 'Personal',
    iconData: Icons.person_3_rounded,
    gradientColors: const [
      Color(0xFFF9B552),
      Color(0xFFF05D70),
    ],
    listOfTasks: [],
  ),
  TodoCollectionModel(
    title: 'Work',
    iconData: Icons.work_rounded,
    gradientColors: const [
      Color(0xFF63ADEF),
      Color(0xFF526BE7),
    ],
    listOfTasks: [],
  ),
  TodoCollectionModel(
    title: 'Other',
    iconData: Icons.devices_other,
    gradientColors: const [
      Color(0xFFA492FC),
      Color.fromARGB(255, 132, 107, 254),
    ],
    listOfTasks: [],
  ),
];
