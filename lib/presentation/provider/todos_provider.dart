import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:river_app/domain/entities/todo.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

//el primer argueento es el notifier y el segundo es el tipo de dato que va a manejar
final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  //retorna el notifier
  return TodosNotifier();
});

//este es el notifier y el tipo de dato que va a manejar que es una lista de todos
class TodosNotifier extends StateNotifier<List<Todo>> {
  //el super es para pasarle el estado inicial
  TodosNotifier()
      : super([
          Todo(
              id: _uuid.v4(),
              description: RandomGeneration.getRandomNames(),
              completeAt: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGeneration.getRandomNames(),
              completeAt: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGeneration.getRandomNames(),
              completeAt: DateTime.now()),
          Todo(
              id: _uuid.v4(),
              description: RandomGeneration.getRandomNames(),
              completeAt: null),
        ]);

  void addTodo() {
    //el state es el estado actual de este provider
    state = [
      //el ... es para que me devuelva una copia del estado actual asi mantengo la data
      ...state,
      Todo(
          id: _uuid.v4(),
          description: RandomGeneration.getRandomNames(),
          completeAt: null),
    ];
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id != id) return todo;

      if (todo.done) return todo.copyWith(completeAt: null);

      return todo.copyWith(completeAt: DateTime.now());
    }).toList();
  }
}
