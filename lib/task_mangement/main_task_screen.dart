import 'package:flutter/material.dart';
import 'package:flutter_application_1/task_mangement/views/screens/all_task_screen.dart';
import 'package:flutter_application_1/task_mangement/views/screens/complete_task_screen.dart';
import 'package:flutter_application_1/task_mangement/views/screens/incomplete_task_screen.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MainTaskScreen(),
  ));
}

class MainTaskScreen extends StatefulWidget {
  const MainTaskScreen({super.key});

  @override
  State<MainTaskScreen> createState() => _MainTaskScreenState();
}

class _MainTaskScreenState extends State<MainTaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  initializeTabController() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    super.initState();
    initializeTabController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(child: Text('M')),
                accountName: Text('Mahmoud'),
                accountEmail: Text('Mahmod.hus@gmail.com')),
            ListTile(
              title: const Text('All task'),
              subtitle: const Text('Go to all task page'),
              leading: const Icon(Icons.list),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                tabController.animateTo(0);
              },
            ),
            ListTile(
              title: const Text('Complete task'),
              subtitle: const Text('Go to Complete task page'),
              leading: const Icon(Icons.done),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                tabController.animateTo(1);
              },
            ),
            ListTile(
              title: const Text('Incomplete task'),
              subtitle: const Text('Go to Incomplete task page'),
              leading: const Icon(Icons.cancel),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                tabController.animateTo(2);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Task Mangement'),
        bottom:  TabBar(
          controller: tabController,
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.black,
            labelColor: Colors.blue,
            tabs: const [
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
      body: TabBarView(
        controller: tabController, 
        children: const [
        AllTaskScreen(),
        CompleteTaskScreen(),
        InCompleteTaskScreen(),
      ]),
    );
  }
}
