import 'package:flutter/material.dart';
import 'package:sports_news_app/auth/botton_navigation.dart';
import 'package:sports_news_app/auth/main_screen.dart';
import 'package:sports_news_app/live_scores/livescores_page.dart';
import 'package:sports_news_app/login/call.dart';
import 'package:sports_news_app/login/password_reset.dart';
import 'package:sports_news_app/login/registration_form.dart';
import 'package:sports_news_app/auth/user_home.dart';
import 'package:sports_news_app/auth/user_profile.dart';
import 'package:sports_news_app/login/splash_screen.dart';
import 'package:sports_news_app/wallet/wallet_screen.dart';
import 'package:sports_news_app/wallet/wallet_dashboard.dart';
import 'package:sports_news_app/wallet/withdrawal_page.dart';
import 'login/login_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LiveScoresPage(),
      routes: {
      //   // '/':(context) => HomeScreen(),
       RegistrationForm.routeName: (context) => const RegistrationForm(),
       HomeScreen.routeName: (context)=> HomeScreen(),
       ResetPasswordScreen.routeName : (context) => ResetPasswordScreen(),
       }
    );
  }
}

