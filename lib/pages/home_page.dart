import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisuministros/bloc/auth_bloc.dart';
import 'package:multisuministros/bloc/navigation/navigation_bloc.dart';
import 'package:multisuministros/routes/app_routes.dart';
import 'package:multisuministros/widgets/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Widget> _widgetOptions = <Widget>[
    const Center(child: Text('Contenido de Home')),
    const Center(child: Text('Contenido de Ajustes')),
    const Center(child: Text('Contenido de Notificaciones')),
    const Center(child: Text('Contenido de Perfil')),
    const Center(child: Text('Contenido de Favoritos')),
  ];

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('Mi Vps'),
        actions: [
          IconButton(onPressed: () {
            authBloc.add(LogoutButtonPressed());
          }, icon: const Icon(Icons.logout_outlined)),
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
      ? BlocProvider(
        create: (context) => NavigationBloc(tabIndex: 0),
        child: NavBar(
          navBarItems: [
            NavBarData(icon: Icons.home),
            NavBarData(icon: Icons.settings),
            NavBarData(icon: Icons.person),
            NavBarData(icon: Icons.favorite),
          ]
        ),
      ) : null,
      body: Row(
        children: [
          if(MediaQuery.of(context).size.width >= 640)
          SafeArea(
            child: BlocProvider(
              create: (context) => NavigationBloc(tabIndex: 0),
              child: BlocBuilder<NavigationBloc, NavigationState>(
                builder: (context, state){
                  int selectedIndex = 0;
                  if (state is NavigationInitial) {
                    selectedIndex = state.tabIndex;
                  }
                  return NavigationRail(
                    extended: false,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('home'),
                        ),
                        NavigationRailDestination(icon: Icon(Icons.settings), label: Text('settings')),
                        NavigationRailDestination(icon: Icon(Icons.notifications), label: Text('notifications')),
                        NavigationRailDestination(icon: Icon(Icons.person), label: Text('User')),
                        NavigationRailDestination(icon: Icon(Icons.favorite), label: Text('Favorites')),
                    ], 
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (int index) {
                      context.read<NavigationBloc>().add(TabChange(index));
                    },
                    );
                    },
                    ),
                    ),
          ),
          Expanded(
            child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state){
                  if (state is AuthSuccess) {
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  }else if(state is AuthLogoutState) {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  }else if(state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error))
                    );
                  }
                }, 
                child: BlocBuilder<NavigationBloc, NavigationState>(
                  builder: (context, state) {
                    int selectedIndex = 0;
                    if (state is NavigationInitial) {
                      selectedIndex = state.tabIndex;
                    }
                    return _widgetOptions[selectedIndex];
                },          
                ),
            ),
            ),
        ],
      ),
      );
  }
}
