import 'package:flutter/widgets.dart';
import 'package:multisuministros/pages/home_page.dart';
import 'package:multisuministros/pages/login_page.dart';
import 'package:multisuministros/pages/settings_page.dart';

class AppRoutes {

  static const String login = 'Login';
  static const String home = 'home';
  static const String settings = 'settings';

  static Map<String, WidgetBuilder> appRoutes = {
  login: ( context ) => const LoginPage(),
  home: ( context ) => const HomePage(),
  settings: ( context ) => const SettingsPage(),
  };

}
