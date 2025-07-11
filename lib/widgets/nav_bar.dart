
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef void OnIntemChanged(int newPosition);

class NavBar extends StatefulWidget {
  final OnIntemChanged onItemChanged;
  final List<NavBarData> navBarItems;
  const NavBar({
    super. key, 
    required this.onItemChanged,
    required this.navBarItems,
    });

  @override
  State<NavBar> createState() => _NavBarState();

}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...widget.navBarItems.map((item) => InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = widget.navBarItems.indexOf(item);
            });
            widget.onItemChanged(_selectedIndex);
          },
            child: NavBarItem(
              data: item, 
              isSelected: widget.navBarItems.indexOf(item)  == _selectedIndex,
              ),
          )),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final NavBarData data;
  final bool isSelected;

  const NavBarItem({
    super.key,
    required this.data,
    required this.isSelected,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15.0),
        decoration: isSelected ? BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary,
        ) : null,
        child: data.icon != null
            ? Icon(
              data.icon, 
              size: 24, 
              color: isSelected ? 
                Theme.of(context).colorScheme.onPrimary : 
                Theme.of(context).colorScheme.primary,
              )
            : Image.asset(data.iconPath!, width: 24, height: 24),
      );

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