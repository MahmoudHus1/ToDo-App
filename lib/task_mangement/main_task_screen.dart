import 'package:flutter/material.dart';
import 'package:flutter_application_1/task_mangement/views/screens/all_task_screen.dart';
import 'package:flutter_application_1/task_mangement/views/screens/complete_task_screen.dart';
import 'package:flutter_application_1/task_mangement/views/screens/incomplete_task_screen.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MainTaskScreen(),
  ));
}

class MainTaskScreen extends StatelessWidget {
  const MainTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Task Mangement'),
          bottom: const TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.black,
            labelColor: Colors.blue, tabs: [
            Tab(
              text: 'All Tasks',
            ),
            Tab(
              text: 'Complete Tasks',
            ),
            Tab(
              text: 'Incomplete Tasks',
            ),
          ]),
        ),
        body: const TabBarView(children: [
          AllTaskScreen(),
          CompleteTaskScreen(),
          InCompleteTaskScreen(),
        ]),
      ),
    );
  }
}
