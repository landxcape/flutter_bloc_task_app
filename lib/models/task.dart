import 'package:equatable/equatable.dart';
import 'package:flutter_tasks_app/services/guid_generator.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final bool isDone;
  final bool isDeleted;
  Task({
    String? id,
    required this.title,
    this.isDone = false,
    this.isDeleted = false,
  }) : id = id ?? GUIDGen.generate();

  Task copyWith({
    String? id,
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        isDone,
        isDeleted,
      ];
}
