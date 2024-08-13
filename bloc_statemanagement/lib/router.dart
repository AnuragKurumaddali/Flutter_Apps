import 'package:bloc_statemanagement/constants/router_constants.dart';
import 'package:bloc_statemanagement/pages/homepage.dart';
import 'package:bloc_statemanagement/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: RouterConstants.home,
      path: "/",
      pageBuilder: (context, state) {
        return const MaterialPage(child: HomePage(title: "Home"));
      },
    ),
    GoRoute(
      name: RouterConstants.second,
      path: "/second",
      pageBuilder: (context, state) {
        return const MaterialPage(child: SecondPage());
      },
    )
  ]);
}
