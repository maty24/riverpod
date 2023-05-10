class Todo {
  final String id;
  final String description;
  final DateTime? completeAt;

  Todo({
    required this.id,
    required this.description,
    required this.completeAt,
  });

  bool get done {
    //va a estar done si es diferente de null
    return completeAt != null;
  }

//el copywith es para que me devuelva una copia del objeto con los nuevos valores
  Todo copyWith({
   // String? id,
    DateTime? completeAt,
    String? description,
  }) {
    return Todo(
      id: id,
      description: description ?? this.description,
      completeAt: completeAt,
    );
  }
}
