import 'package:flutter/material.dart';
import 'package:sports_news_app/auth/botton_navigation.dart';
import 'package:sports_news_app/auth/navigation.dart';
import 'package:sports_news_app/auth/registration_form.dart';
import 'package:sports_news_app/auth/sign_up.dart';
import 'package:sports_news_app/auth/user_home.dart';
import 'package:sports_news_app/auth/user_profile.dart';
import 'package:sports_news_app/wallet/cash.dart';
import 'package:sports_news_app/wallet/wallet_dashboard.dart';
import 'auth/login_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:DashboardPage(),
    );
  }
}

