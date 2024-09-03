import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:login_firebase/constants/constant.dart';
import 'package:login_firebase/src/core/theme/palette.dart';

import '../init_dependencies.dart';
import '../navigation/router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAuth _firebaseAuth = serviceLocator<FirebaseAuth>();

  @override
  void initState() {
    super.initState();
    _checkAuthState();
  }

  void _checkAuthState() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        context.go(AppRoute.dashboard);
      } else {
        context.go(AppRoute.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.whiteColor,
      child: Center(
        child: SvgPicture.asset(Constant.splashIcon),
      ),
    );
  }
}
