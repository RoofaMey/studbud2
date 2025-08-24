import 'package:flutter/material.dart';

class StudyPlannerPage extends StatelessWidget {
  static const String id = 'StudyPlannerPage';

  const StudyPlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Study Planner',
          style: TextStyle(fontSize: 55.6, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}