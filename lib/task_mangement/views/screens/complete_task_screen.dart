import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/task_mangement/models/dummy_data.dart';
import 'package:flutter_application_1/task_mangement/models/task_model.dart';
import 'package:flutter_application_1/task_mangement/views/widgets/task_widget.dart';

class CompleteTaskScreen extends StatefulWidget {
  const CompleteTaskScreen({super.key});

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {
  checkTask(TaskModel taskModel) {
    int index = tasks.indexOf(taskModel);
    tasks[index].inComplete = !tasks[index].inComplete;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.where((element) => element.inComplete).length,
      itemBuilder: (context, index) {
        return TaskWidget(
            tM: tasks.where((element) => element.inComplete).toList()[index],
           function : checkTask
           );
      },
    );
  }
}
