import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login_firebase/src/core/theme/palette.dart';

import '../../../../core/navigation/router.dart';
import '../../../auth/presentation/bloc/login/login_bloc.dart';

class Dashboard extends StatelessWidget {


  Dashboard({super.key});

  void _logout(BuildContext context) {
    context.read<LoginBloc>().add(LogoutRequestedEvent());
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
