
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisuministros/bloc/navigation/navigation_bloc.dart';

typedef void OnIntemChanged(int newPosition);

class NavBar extends StatelessWidget{
  //final OnIntemChanged onItemChanged;
  final List<NavBarData> navBarItems;
  const NavBar({
    super. key, 
    //required this.onItemChanged,
    required this.navBarItems,
    });

  //@override
  //State<NavBar> createState() => _NavBarState();

//}

//class _NavBarState extends State<NavBar> {
  //int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        int selectedIndex = 0;
        if (state is NavigationInitial) {
          selectedIndex = state.tabIndex;
        }

      return  Container(
        height: 56,
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...navBarItems.map((item) {
              final int itemIndex = navBarItems.indexOf(item);
              return InkWell(
                onTap: () {
              // setState(() {
              //   _selectedIndex = widget.navBarItems.indexOf(item);
              // });
              //widget.onItemChanged(_selectedIndex);
                  context.read<NavigationBloc>().add(TabChange( itemIndex));

              },
              child: NavBarItem(
                data: item, 
                isSelected: itemIndex  == selectedIndex,
                ),
            );
            }),
          ],
        ),
      );
      },
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