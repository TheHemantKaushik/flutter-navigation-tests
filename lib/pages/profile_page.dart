import 'package:flutter/material.dart';
import 'package:flutter_navigation_tests/data/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: Center(
        child: ElevatedButton(
          child: const Text('Logout'),
          onPressed: () {
            ref.read(isLoggedInProvider.notifier).state = false;
            context.go('/login');
          },
        ),
      ),
    );
  }
}
