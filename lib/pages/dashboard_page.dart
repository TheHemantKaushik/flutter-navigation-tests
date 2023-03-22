import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Text('Dashboard'),
        TextButton(
          child: const Text('Home'),
          onPressed: () => context.go('/'),
        ),
        TextButton(
          child: const Text('Login'),
          onPressed: () => context.go('/login'),
        ),
        TextButton(
          child: const Text('Signup'),
          onPressed: () => context.go('/signup'),
        ),
        TextButton(
          child: const Text('Users'),
          onPressed: () => context.go('/users'),
        ),
      ],
    );
  }
}
