import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/task_mangement/models/dummy_data.dart';
import 'package:flutter_application_1/task_mangement/views/widgets/task_widget.dart';

import '../../models/task_model.dart';

class InCompleteTaskScreen extends StatefulWidget {
  const InCompleteTaskScreen({super.key});

  @override
  State<InCompleteTaskScreen> createState() => _InCompleteTaskScreenState();
}

class _InCompleteTaskScreenState extends State<InCompleteTaskScreen> {
  @override
  Widget build(BuildContext context) {
    checkTask(TaskModel taskModel) {
      int index = tasks.indexOf(taskModel);
      tasks[index].inComplete = !tasks[index].inComplete;
      setState(() {});
    }

    return ListView.builder(
      itemCount: tasks.where((element) => !element.inComplete).length,
      itemBuilder: (context, index) {
        return TaskWidget(
            tM: tasks.where((element) => !element.inComplete).toList()[index],
            function : checkTask
        );
      },
    );
  }
}
