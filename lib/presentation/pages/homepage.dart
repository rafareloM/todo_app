import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/controller/homepage.controller.dart';
import 'package:todo_app/presentation/widget/task_tile.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = GetIt.instance.get<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Adicionar Tarefa'),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: ((context) => Column(
                children: [
                  const Text(
                    'Adicionando nova Tarefa:',
                    style: TextStyle(fontSize: 24),
                  ),
                  TextFormField(
                    controller: _controller.textEditingController,
                  ),
                  TextButton(
                      onPressed: () => _controller
                          .add(_controller.textEditingController.text),
                      child: const Text('Criar Tarefa'))
                ],
              )),
        ),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: _controller.taskList.length,
          itemBuilder: (_, index) => TaskTile(
            onTap: () {
              _controller.resolveTask(_controller.taskList[index]);
              setState(() {});
            },
            title: _controller.taskList[index].title,
            isSelected: _controller.taskList[index].isResolved,
          ),
        ),
      ),
    );
  }
}
