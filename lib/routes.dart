import 'package:flutter/material.dart';
import 'package:flutter_navigation_tests/data/auth_provider.dart';
import 'package:flutter_navigation_tests/pages/dashboard_page.dart';
import 'package:flutter_navigation_tests/pages/login_page.dart';
import 'package:flutter_navigation_tests/pages/profile_page.dart';
import 'package:flutter_navigation_tests/pages/signup_page.dart';
import 'package:flutter_navigation_tests/pages/user_detail_page.dart';
import 'package:flutter_navigation_tests/pages/user_list_page.dart';
import 'package:flutter_navigation_tests/widgets/dashboard_view.dart';
import 'package:riverpod_context/riverpod_context.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => DashboardView(child: child),
      routes: [
        _createProtectedRoute(
          path: '/',
          builder: (context, state) => const DashboardPage(),
        ),
        _createProtectedRoute(
          path: '/users',
          builder: (context, state) => const UserListPage(),
          routes: [
            _createProtectedRoute(
              path: ':id',
              builder: (context, state) =>
                  UserDetailPage(userId: state.params['id']!),
            ),
          ],
        ),
        _createProtectedRoute(
          path: '/favorites',
          builder: (context, state) => const UserListPage(),
          routes: [
            _createProtectedRoute(
              path: ':id',
              builder: (context, state) =>
                  UserDetailPage(userId: state.params['id']!),
            ),
          ],
        ),
        _createProtectedRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) =>
          LoginPage(redirectPath: state.queryParams['redirect']),
    ),
    GoRoute(
      path: '/signup',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SignupPage(),
    ),
  ],
);

GoRoute _createProtectedRoute({
  required String path,
  GoRouterWidgetBuilder? builder,
  List<RouteBase>? routes,
}) {
  return GoRoute(
    path: path,
    builder: builder,
    redirect: (context, state) {
      final isLoggedIn = context.read(isLoggedInProvider);
      if (isLoggedIn) return null;

      debugPrint({
        'path': state.fullpath,
        'isLoggedIn': isLoggedIn,
      }.toString());

      final path = state.fullpath;
      return path == null ? '/login' : '/login?redirect=$path';
    },
  );
}
