import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart'; // Make sure this matches your file name

class LoadingScreenPage extends StatefulWidget {
  static const String id='LoadingScreenPage';
  const LoadingScreenPage({super.key});

  @override
  State<LoadingScreenPage> createState() => _LoadingScreenPageState();
}

class _LoadingScreenPageState extends State<LoadingScreenPage> {
  @override
  void initState() {
    super.initState();

    // Wait for 2 seconds, then go to HomePage
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(
        context, HomePage.id
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF4F4F4), // light gray background
      body: Center(
        child: Icon(
          Icons.menu_book_rounded, // book + pencil icon
          size: 64,
          color: Colors.black,
        ),
      ),
    );
  }
}
