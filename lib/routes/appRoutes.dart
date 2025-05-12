import 'package:flutter/widgets.dart';
import 'package:multisuministros/pages/login_page.dart';

class AppRoutes {

  static const String login = 'Login';
  static const String menu = 'menu';

  static Map<String, WidgetBuilder> appRoutes = {
  login: ( context ) => const LoginPage(),
  };

}
