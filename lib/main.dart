import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/theme_controller.dart';
import 'package:todo_app/core/utils/app_theme.dart';
import 'package:todo_app/views/screens/edit_view.dart';
import 'package:todo_app/views/screens/manage_task_view.dart';
import 'package:todo_app/views/screens/settings_view.dart';
import 'package:todo_app/views/screens/task_schedule_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: const TaskManagementApp(),
    ),
  );
}

class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, themeController, _) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeController.themeMode,
          home: const TaskManagementHome(),
        );
      },
    );
  }
}

class TaskManagementHome extends StatefulWidget {
  const TaskManagementHome({Key? key}) : super(key: key);

  @override
  State<TaskManagementHome> createState() => _TaskManagementHomeState();
}

class _TaskManagementHomeState extends State<TaskManagementHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    ManageTaskView(),
    EditView(),
    TaskScheduleView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedItemColor: Theme.of(context).colorScheme.onPrimary,
            unselectedItemColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.folder_outlined), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.edit_outlined), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.shield_outlined), label: ''),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
