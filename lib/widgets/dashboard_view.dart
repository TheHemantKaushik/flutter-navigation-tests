import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardView extends ConsumerStatefulWidget {
  final Widget child;
  const DashboardView({super.key, required this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

const tabs = [
  BottomNavBarTabItem(
    basePath: '/users',
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavBarTabItem(
    basePath: '/favorites',
    icon: Icon(Icons.favorite),
    label: 'Favorite',
  ),
  BottomNavBarTabItem(
    basePath: '/profile',
    icon: Icon(Icons.account_circle),
    label: 'Profile',
  ),
];

class _DashboardViewState extends ConsumerState<DashboardView> {
  String get _currentPath => GoRouter.of(context).location;
  int get _currentIndex => _tabLocationToIndex(_currentPath);

  int _tabLocationToIndex(String location) {
    final index = tabs.indexWhere((t) => location.startsWith(t.basePath));
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(int index) {
    if (_currentIndex != index) {
      context.go(tabs[index].basePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('path=$_currentPath, index=$_currentIndex');

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: tabs,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class BottomNavBarTabItem extends BottomNavigationBarItem {
  /// The initial location/path
  final String basePath;

  const BottomNavBarTabItem({
    required this.basePath,
    required Widget icon,
    required String label,
  }) : super(icon: icon, label: label);
}
