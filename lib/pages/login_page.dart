import 'package:flutter/material.dart';
import 'package:flutter_navigation_tests/data/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerWidget {
  final String? redirectPath;

  const LoginPage({super.key, this.redirectPath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            ref.read(isLoggedInProvider.notifier).state = true;
            context.go(redirectPath ?? '/');
          },
        ),
      ),
    );
  }
}
