import 'package:flutter/material.dart';
import 'package:flutter_navigation_tests/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Text('Dashboard'),
        TextButton(
          child: const Text('Home'),
          onPressed: () => ref.read(routerProvider).go('/'),
        ),
        TextButton(
          child: const Text('Login'),
          onPressed: () => ref.read(routerProvider).go('/login'),
        ),
        TextButton(
          child: const Text('Signup'),
          onPressed: () => ref.read(routerProvider).go('/signup'),
        ),
        TextButton(
          child: const Text('Users'),
          onPressed: () => ref.read(routerProvider).go('/users'),
        ),
      ],
    );
  }
}
