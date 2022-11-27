import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/controller/homepage.controller.dart';
import 'package:todo_app/presentation/pages/homepage.dart';

void main() {
  final getIt = GetIt.instance;

  getIt.registerSingleton(HomePageController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}
