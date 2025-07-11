import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisuministros/bloc/auth_bloc.dart';
import 'package:multisuministros/routes/app_routes.dart';
import 'package:multisuministros/widgets/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      ? NavBar(
        onItemChanged: (int newPosition ) {

        },
        navBarItems: [
          NavBarData(icon: Icons.home),
          NavBarData(icon: Icons.settings),
          NavBarData(icon: Icons.notifications),
          NavBarData(icon: Icons.person),
          NavBarData(icon: Icons.favorite),
          ]
        ) : null,
      body: Row(
        children: [
          if(MediaQuery.of(context).size.width >= 640)
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations:[
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(icon: Icon(Icons.settings), label: Text('settings')),
                NavigationRailDestination(icon: Icon(Icons.notifications), label: Text('settings')),
                NavigationRailDestination(icon: Icon(Icons.person), label: Text('settings')),
                NavigationRailDestination(icon: Icon(Icons.favorite), label: Text('settings')),
              ],
                selectedIndex: 0,
                onDestinationSelected: (int index) {
                  // Handle navigation rail item selection
                },
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
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(itemBuilder:(context, index) {
                        return ListTile(
                          title: Text('List Item $index'),
                        );
                      },)
                    ),
                    
                  ],
                ),
                           
                ),
            )
        ],
      ),
      );
  }
}
