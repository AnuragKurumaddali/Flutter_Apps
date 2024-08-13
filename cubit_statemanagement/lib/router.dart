import 'package:cubit_statemanagement/constants/router_constants.dart';
import 'package:cubit_statemanagement/pages/SecondPage.dart';
import 'package:cubit_statemanagement/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: RouterConstants.home,
      path: "/",
      pageBuilder: (context, state) =>
          const MaterialPage(child: HomePage(title: "Home")),
    ),
    GoRoute(
      name: RouterConstants.second,
      path: "/second_page",
      pageBuilder: (context, state) => const MaterialPage(child: SecondPage()),
    )
  ]);
}
