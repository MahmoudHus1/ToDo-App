import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/task_mangement/models/dummy_data.dart';
import 'package:flutter_application_1/task_mangement/views/widgets/task_widget.dart';

import '../../models/task_model.dart';

class AllTaskScreen extends StatefulWidget{
  const AllTaskScreen({super.key});

  @override
  State<AllTaskScreen> createState() => _AllTaskScreenState();
}

class _AllTaskScreenState extends State<AllTaskScreen> {
    checkTask(TaskModel taskModel) {
    int index = tasks.indexOf(taskModel);
    tasks[index].inComplete = !tasks[index].inComplete;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskWidget(tM: tasks[index],
         function : checkTask
         );
      },);
  }
}