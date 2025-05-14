import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisuministros/bloc/auth_bloc.dart';
import 'package:multisuministros/pages/login_page.dart';
import 'package:multisuministros/routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ( _ ) => AuthBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Multisuministros',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        initialRoute: AppRoutes.login,
        routes: AppRoutes.appRoutes,
        // home: Scaffold(
        //   appBar: AppBar(title: const Text('Material App Bar')),
        //   body: const Center(child: Text('Hello World')),
        // ),
      ),
    );
  }
}
