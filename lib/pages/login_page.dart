import 'package:flutter/material.dart';
import 'package:flutter_navigation_tests/data/auth_provider.dart';
import 'package:flutter_navigation_tests/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  final String redirectPath;

  const LoginPage({super.key, required this.redirectPath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(isLoggedInProvider, (previous, next) {
      if (next) {
        ref.read(routerProvider).go(redirectPath);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Complete Login'),
              onPressed: () {
                ref.read(isLoggedInProvider.notifier).state = true;
              },
            ),
            ElevatedButton(
              child: const Text('Create a new account'),
              onPressed: () {
                ref.read(routerProvider).go('/signup?redirect=$redirectPath');
              },
            ),
          ],
        ),
      ),
    );
  }
}
