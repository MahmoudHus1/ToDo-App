import 'package:flutter/material.dart';
import 'package:flutter_application_1/task_mangement/models/task_model.dart';


class TaskWidget extends StatefulWidget {
  final TaskModel tM;
  final Function function;
  const TaskWidget({required this.tM, required this.function,super.key});

  @override
  State<TaskWidget> createState() => TaskWidgetState();
}

class TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.orange,
      checkColor: Colors.blue,
      title: Text(widget.tM.name),
      value: widget.tM.inComplete, onChanged: (value) {
        setState(() {
          widget.function(widget.tM);
        });
    },);
  }
}