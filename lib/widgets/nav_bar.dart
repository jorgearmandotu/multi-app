
import 'package:flutter/widgets.dart';

typedef void OnIntemChanged(int newPosition);

class NavBar extends StatefulWidget {
  final OnIntemChanged onItemChanged;
  const NavBar({super. key, required this.onItemChanged,});

  @override
  State<NavBar> createState() => _NavBarState();

}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class NavBarData {
  final IconData? icon;
  final String? iconPath;

  NavBarData({
    this.icon,
    this.iconPath,
  }) {
    assert(icon != null || iconPath != null, 'Either icon or iconPath must be provided');
  }
}