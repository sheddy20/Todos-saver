import 'package:get/get.dart';
import 'package:socialape/controllers/todoController.dart';

class TodoController extends GetxController {
  // ignore: deprecated_member_use
  List<Todos> _todos = List<Todos>();

  List<Todos> get getTodos {
    return _todos;
  }

  void addTodos(String todo, String savedTodo) {
    Todos todos = Todos(todo, savedTodo);
    _todos.add(todos);
    update();
  }

  void deleteTodos(int index) {
    _todos.removeAt(index);
    update();
  }
}
