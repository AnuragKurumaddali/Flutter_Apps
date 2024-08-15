import 'package:flutter/material.dart';
import 'package:login_firebase/pages/login_page.dart';
import 'pages/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SafeArea(child: LoginPage()),
    );
  }
}