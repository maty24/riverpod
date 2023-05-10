import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/provider/todos_provider.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de invitados'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //estoy accediendo al provider y al notifier, el addTodo es una funcion que esta en el providernotifier
          ref.read(todosProvider.notifier).addTodo();
        },
      ),
    );
  }
}

class _TodosView extends ConsumerWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        //mantiene la referencia del todo no se vuelve a crear
        final todo = todos[index];
        return SwitchListTile(
            title: Text(todo.description),
            subtitle: Text(todo.completeAt.toString()),
            value: todo.done, // True o False
            onChanged: (value) {
              ref.read(todosProvider.notifier).toggleTodo(todo.id);
            });
      },
    );
  }
}
