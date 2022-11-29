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
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: _controller.clear,
        ),
      ),
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
                      onPressed: () {
                        if (_controller.textEditingController.text == '') {
                          _controller.textEditingController.text =
                              'Tarefa Sem Título';
                        }
                        _controller.add(_controller.textEditingController.text);
                        _controller.textEditingController.text = '';
                      },
                      child: const Text('Criar Tarefa'))
                ],
              )),
        ),
      ),
      body: Observer(
        builder: (context) => ListView(
            children: _controller.taskList
                .map(
                  (task) => TaskTile(
                    onTap: () {
                      _controller.resolveTask(task);
                    },
                    title: task.title,
                    isSelected: task.isResolved,
                  ),
                )
                .toList()),
      ),
    );
  }
}
