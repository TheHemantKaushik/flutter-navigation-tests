import 'package:flutter/material.dart';
import 'package:flutter_navigation_tests/pages/dashboard_page.dart';
import 'package:flutter_navigation_tests/pages/login_page.dart';
import 'package:flutter_navigation_tests/pages/signup_page.dart';
import 'package:flutter_navigation_tests/pages/user_detail_page.dart';
import 'package:flutter_navigation_tests/pages/user_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Navigation',
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const DashboardPage(),
    routes: [
      GoRoute(
        path: 'users',
        builder: (context, state) => const UserListPage(),
      ),
      GoRoute(
        path: 'users/:id',
        builder: (context, state) =>
            UserDetailPage(userId: state.params['id']!),
      ),
    ],
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const SignupPage(),
  ),
]);
