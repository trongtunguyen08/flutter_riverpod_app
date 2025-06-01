import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/core/router/route_name.dart';
import 'package:flutter_riverpod_app/screens/home/ui/widget/home_screen.dart';
import 'package:flutter_riverpod_app/screens/login/presentation/ui/widget/login_screen.dart';
import 'package:flutter_riverpod_app/screens/signup/presentation/ui/widget/signup_screen.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: '/',
        name: loginRoute,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: "/signup",
        name: signupRoute,
        builder: (context, state) {
          return const SignupScreen();
        },
      ),
      GoRoute(
        path: "/home",
        name: homeRoute,
        builder: (context, state) {
          // This is a placeholder for the home screen.
          // Replace with your actual home screen widget.
          return const HomeScreen();
        },
      ),
    ],
  );
});
