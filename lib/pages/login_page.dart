

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisuministros/bloc/auth_bloc.dart';
import 'package:multisuministros/models/user.dart';
import 'package:multisuministros/routes/app_routes.dart';
import 'package:multisuministros/widgets/password_textfield.dart';


class LoginPage extends StatelessWidget {
const LoginPage({ super.key});

  @override
  Widget build(BuildContext context) {

    //final authBloc = BlocProvider.of<AuthBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicia sesion'),
      ),
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state){
            if (state is AuthSuccess) {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            }else if(state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error))
              );
            }
          }, 
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: _Form()),),
     ),
   );
  }
}


class _Form extends StatelessWidget {


  final emailCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  _Form();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context, listen: true);
    final state = authBloc.state;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/logo/ic_launcher.png', height: 100,),
          const SizedBox(height: 16.0,),
          TextFormField(
            controller: emailCtr,
            keyboardType: TextInputType.emailAddress,
            decoration:  InputDecoration(
              labelText: 'Correo Electronico', 
              prefixIcon: Icon(Icons.email_outlined, color: theme.colorScheme.primary,),
              border: OutlineInputBorder()
              ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo requerido';
              }
              final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Por favor, ingresa un correo electrónico válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0,),
          PasswordTextField(controllerText: passwordCtr),
          const SizedBox(height: 16.0),
          if(state is AuthError)
            Text(state.error, style: const TextStyle(color: Colors.red),),
          const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: state is AuthLoading ? null 
              : (){
                if (_formKey.currentState!.validate()) {
                  final newUser = User(email: emailCtr.text.trim(), password: passwordCtr.text.trim());
                  authBloc.add(LoginButtonPressed(newUser.email, newUser.password));
                }
              },
            child: state is AuthLoading
            ? const CircularProgressIndicator()
            : const Text('Iniciar Sesion'))
        ],
      )
    );
    
  }
  

  

}
