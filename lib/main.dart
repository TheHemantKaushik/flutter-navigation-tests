import 'package:flutter/material.dart';
import 'package:flutter_navigation_tests/data/auth_provider.dart';
import 'package:flutter_navigation_tests/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    ref.listen(isLoggedInProvider, (previous, next) {
      if (!next) {
        ref.read(routerProvider).go('/');
      }
    });

    return MaterialApp.router(
      title: 'Flutter Navigation',
      routerConfig: router,
    );
  }
}
