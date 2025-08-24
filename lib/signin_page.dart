import 'package:flutter/material.dart';
import 'create_account_page.dart';
import 'forgotpassword_page.dart';
import 'loadingscreen_page.dart';

class SignInPage extends StatefulWidget {
  static const String id='SignInPage';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Column(
        children: [
          // Header
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40, left: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.menu_book, size: 28, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  "STUDBUD",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PixelFont',
                  ),
                ),
              ],
            ),
          ),

          // Form
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 500),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign in to your account",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 25),

                        // Email Field
                        TextField(
                          decoration: InputDecoration(
                            hintText: "E-mail Address",
                            filled: true,
                            fillColor: Colors.grey[300],
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Password Field
                        TextField(
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            filled: true,
                            fillColor: Colors.grey[300],
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Forgot Password Link
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context, ForgotPasswordPage.id);
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context, LoadingScreenPage.id
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                        const Center(
                          child: Text(
                            "or",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        const SizedBox(height: 25),

                        // Facebook Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.facebook, color: Colors.white, size: 25),
                            label: const Text(
                              "Login with Facebook",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[600],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Google Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.android, color: Colors.white),
                            label: const Text(
                              "Login with Google",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              foregroundColor: Colors.black,
                            ),
                          ),
                        ),

                        const SizedBox(height: 35),

                        // Sign Up Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Didn't have an account? ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context, CreateAccountPage.id
                                );
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 50),

                        // Terms
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: "By continuing, you agree to our ",
                              style: const TextStyle(fontSize: 15, color: Colors.grey),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer
          Container(
            height: 60,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: const Center(
              child: Text(
                '© 2025 StudBud',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
