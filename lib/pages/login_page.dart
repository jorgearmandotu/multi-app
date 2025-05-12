

import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
const LoginPage({ super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: Text('Hola login'),
     ),
   );
  }
}
