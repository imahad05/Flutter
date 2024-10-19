import 'package:flutter/material.dart';

// Main Teacher's Dashboard
class TeachersDashboard extends StatefulWidget {
  const TeachersDashboard({super.key});

  @override
  State<TeachersDashboard> createState() => _TeachersDashboardState();
}

class _TeachersDashboardState extends State<TeachersDashboard> {
  // List of tabs' titles and icons
  final List<Map<String, dynamic>> _tabs = [
    {"title": "Dashboard", "icon": Icons.dashboard},
    {"title": "Students Reports", "icon": Icons.report},
    {"title": "Students Attendance", "icon": Icons.access_time},
    {"title": "Time Table", "icon": Icons.table_chart},
  ];

  // Popup menu options
  final List<Map<String, dynamic>> _menuOptions = [
    {"value": 1, "label": "Profile"},
    {"value": 2, "label": "Settings"},
    {"value": 3, "label": "Logout"}
  ];

  // Reusable tab text style
  TextStyle _tabTextStyle() {
    return const TextStyle(color: Colors.white, fontWeight: FontWeight.w600);
  }

  // Function to build the AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.teal,
      title: const Text(
        "Teacher Dashboard",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [_buildPopupMenu()],
      bottom: TabBar(
        tabs: _tabs
            .map((tab) => Tab(
                  icon: Icon(tab['icon'], color: Colors.white),
                  child: Text(
                    tab['title'],
                    style: _tabTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ))
            .toList(),
      ),
    );
  }

  // Function to build the PopupMenuButton
  PopupMenuButton _buildPopupMenu() {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert_outlined, color: Colors.white),
      itemBuilder: (context) => _menuOptions
          .map((option) => PopupMenuItem(
                value: option['value'],
                child: Text(option['label']),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: TabBarView(
          children: _tabs.map((tab) {
            // Returning a placeholder widget for each tab's view
            return Center(
              child: Text("${tab['title']} Content"),
            );
          }).toList(),
        ),
      ),
    );
  }
}
