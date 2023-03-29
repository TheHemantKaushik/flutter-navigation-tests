import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text('User: $index'),
            onTap: () {
              final loc = GoRouter.of(context).location;
              context.go('$loc/$index');
            },
          ),
        ),
      ),
    );
  }
}
