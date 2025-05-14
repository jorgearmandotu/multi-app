

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisuministros/bloc/auth_bloc.dart';
import 'package:multisuministros/models/user.dart';
import 'package:multisuministros/routes/app_routes.dart';


class LoginPage extends StatelessWidget {
const LoginPage({ super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final authBloc = BlocProvider.of<AuthBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicia sesion'),
      ),
      //backgroundColor: theme.colorScheme.onSecondary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/logo/ic_launcher.png', height: 100,),
                const SizedBox(height: 16.0,),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Correo Electronico', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16.0,),
                const TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(labelText: 'Contraseña', border: OutlineInputBorder()),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: (){
                    final newUser = User(name: 'usuario logueado pedro', password: '1233');
                    authBloc.add(LoginUser(newUser));
                    Navigator.pushNamed(context, AppRoutes.home);
                  },
                  child: Text('Iniciar Sesion'))
              ],
            )
          ),
        ),
     ),
   );
  }
}


class _Form extends StatelessWidget {


  final emailCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  
  _Form();

  @override
  Widget build(BuildContext context) {
    
    throw UnimplementedError();
  }
  

  

}
