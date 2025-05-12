

import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
const LoginPage({ super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onSecondary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FlutterLogo(size: 100,),
                const SizedBox(height: 32.0,),
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
                  onPressed: (){},
                  child: Text('Iniciar Sesion'))
              ],
            )
          ),
        ),
     ),
   );
  }
}
