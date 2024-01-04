import 'package:flutter/material.dart';

class NavBarIcon extends StatelessWidget {
  final double iconSize;
  final String labelText;
  final IconData icon;

  const NavBarIcon(
      {super.key,
      required this.iconSize,
      required this.labelText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: Icon(
        icon,
        size: iconSize,
      ),
      icon: Icon(icon),
      label: labelText,
    );
  }
}
