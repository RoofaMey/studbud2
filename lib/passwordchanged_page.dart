import 'package:flutter/material.dart';
import 'package:studbud2/main.dart';
import 'signin_page.dart';

class StudBudApp extends StatelessWidget {
  const StudBudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Changed',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: true,
      ),
      home: const PasswordChangedPage(),
    );
  }
}

class PasswordChangedPage extends StatelessWidget {
  static const String id='PasswordChangedPage';
  const PasswordChangedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            // Top logo bar
            Container(
              height: 60,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.edit_note, size: 30),
              ),
            ),

            // Main content
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.edit_note, size: 80),
                      const SizedBox(height: 20),
                      const Text(
                        'Password Changed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Your password has been changed\nsuccessfully!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          elevation: 6,
                          shadowColor: Colors.black54,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context, SignInPage.id
                          );
                        },
                        child: const Text('Back to Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
