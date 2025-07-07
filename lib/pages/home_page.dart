import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisuministros/bloc/auth_bloc.dart';
import 'package:multisuministros/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Principal'),
        actions: [
          IconButton(onPressed: () {
            authBloc.add(LogoutButtonPressed());
          }, icon: const Icon(Icons.logout_outlined)),
        ],
      ),
      body: SafeArea(
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Text('Logueado')),),
      ),
    );
  }
}
