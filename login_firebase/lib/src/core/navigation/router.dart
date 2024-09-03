import 'package:go_router/go_router.dart';
import 'package:login_firebase/src/features/dashboard/dashboard.dart';
import 'package:login_firebase/src/features/auth/domain/entities/user_entity.dart';
import 'package:login_firebase/src/features/auth/presentation/pages/login_page.dart';
import 'package:login_firebase/src/features/auth/presentation/pages/signup_page.dart';
import 'package:login_firebase/src/features/splash/splash_page.dart';

class AppRoute {
  AppRoute._();

  static const splash = "/";
  static const login =
      "/login"; //make sure to use a leading slash for top-level routes
  static const signup = "/signup";
  static const dashboard = "/dashboard";
}

class AppRouter {
  static final router = GoRouter(initialLocation: AppRoute.splash, routes: [
    GoRoute(
      path: AppRoute.splash,
      builder: (context, state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: AppRoute.login,
      builder: (context, state) {
        final UserEntity? userEntity =
            state.extra != null ? state.extra as UserEntity : null;
        return LoginPage(
          userEntity: userEntity,
        );
      },
    ),
    GoRoute(
      path: AppRoute.signup,
      builder: (context, state) {
        return const SignupPage();
      },
    ),
    GoRoute(
      path: AppRoute.dashboard,
      builder: (context, state) {
        return Dashboard();
      },
    ),
  ]);
}
