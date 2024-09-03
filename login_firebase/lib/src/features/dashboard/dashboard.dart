import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_firebase/init_dependencies.dart';
import 'package:login_firebase/navigation/router.dart';
import 'package:login_firebase/src/core/theme/palette.dart';

class Dashboard extends StatelessWidget {

  final FirebaseAuth _firebaseAuth = serviceLocator<FirebaseAuth>();

  Dashboard({super.key});

  void _logout(BuildContext context) {
    _firebaseAuth.signOut();
    context.go(AppRoute.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                _logout(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Palette.whiteColor,
              ))
        ],
      ),
      drawer: const Drawer(),
      body: const Center(
        child: Text("Welcome to Dashboard"),
      ),
    );
  }
}
