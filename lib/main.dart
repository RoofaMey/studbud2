import 'package:flutter/material.dart';
import 'package:studbud2/create_account_page.dart';
import 'signin_page.dart';
import 'landingpage.dart';
import 'forgotpassword_page.dart';
import 'checkemail_page.dart';
import 'home_page.dart';
import 'loadingscreen_page.dart';
import 'passwordchanged_page.dart';
import 'profile_page.dart';
import 'resetpassword_page.dart';
import 'studyplanner_page.dart';
import 'verifycode_page.dart';
import 'weather_page.dart';
import 'welcome_page.dart';

void main() {
  runApp(const StudBudApp());
}

class StudBudApp extends StatelessWidget {
  const StudBudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PixelFont',
      ),
      initialRoute: LandingPage.id,
      routes: {
        SignInPage.id: (context) => const SignInPage(),
        CreateAccountPage.id: (context) => const CreateAccountPage(),
        ForgotPasswordPage.id: (context) => const ForgotPasswordPage(),
        CheckEmailPage.id: (context) => const CheckEmailPage(),
        ResetPasswordPage.id: (context) => const ResetPasswordPage(),
        PasswordChangedPage.id: (context) => const PasswordChangedPage(),
        VerifyCodePage.id: (context) => const VerifyCodePage(),
        WelcomePage.id: (context) => const WelcomePage(),
        LoadingScreenPage.id: (context) => const LoadingScreenPage(),
        HomePage.id: (context) => const HomePage(),
        WeatherPage.id: (context) => const WeatherPage(),
        StudyPlannerPage.id: (context) => const StudyPlannerPage(),
      },
    );
  }
}

