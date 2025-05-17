import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget 
{
  final TextEditingController controllerText;
  
  const PasswordTextField({super.key, required this.controllerText});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState(controllerText: controllerText);
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  
  final TextEditingController controllerText;
  bool _obscureText = true;
  
  _PasswordTextFieldState({required this.controllerText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controllerText,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.password, color: theme.colorScheme.primary,),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: theme.colorScheme.primary,),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingresa tu contraseña';
        }
        return null;
      },
    );
  }
}