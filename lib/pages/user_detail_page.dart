import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDetailPage extends ConsumerWidget {
  final String userId;

  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text('UserDetail: $userId');
  }
}
