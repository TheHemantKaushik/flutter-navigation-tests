import 'package:flutter/material.dart';
import 'package:flutter_navigation_tests/data/auth_provider.dart';
import 'package:flutter_navigation_tests/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerWidget {
  final String redirectPath;

  const SignupPage({super.key, required this.redirectPath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(isLoggedInProvider, (previous, next) {
      if (next) {
        ref.read(routerProvider).go(redirectPath);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Signup'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Already have a account'),
              onPressed: () {
                ref.read(routerProvider).go('/login?redirect=$redirectPath');
              },
            ),
            ElevatedButton(
              child: const Text('Complete Signup'),
              onPressed: () {
                ref.read(isLoggedInProvider.notifier).state = true;
              },
            ),
          ],
        ),
      ),
    );
  }
}
