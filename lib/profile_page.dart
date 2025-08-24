import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String id = 'ProfilePage';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Settings',
          style: TextStyle(fontSize: 55.6, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}