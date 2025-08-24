import 'package:flutter/material.dart';
import 'package:studbud2/create_account_page.dart';
import 'package:studbud2/forgotpassword_page.dart';
import 'signin_page.dart';
class LandingPage extends StatelessWidget {
  static const String id='LandingPage';
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    const Text(
                      "WELCOMEOW!",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Icon(Icons.menu_book, size: 150, color: Colors.black),
                    const SizedBox(height: 20),
                    const Text(
                      "STUDBUD:",
                      style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Student Life Companion App",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 30),

                    // LOGIN WITH EMAIL -> Go to SignInPage
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                          context, SignInPage.id,);
                      },
                      icon: const Icon(Icons.email),
                      label: const Text(
                        "LOGIN WITH EMAIL",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // LOGIN WITH FACEBOOK
                    ElevatedButton.icon(
                      onPressed: () {}, //facebook login
                      icon: const Icon(Icons.facebook),
                      label: const Text(
                        "LOGIN WITH FACEBOOK",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Didn't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, CreateAccountPage.id);
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Icon(Icons.pets, size: 40, color: Colors.black),
                    const SizedBox(height: 25),
                    Text.rich(
                      TextSpan(
                        text: "By continuing, you agree to our ",
                        style: const TextStyle(fontSize: 15),
                        children: [
                          TextSpan(
                            text: "Terms",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(text: " & "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
