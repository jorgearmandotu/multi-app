import 'package:flutter/widgets.dart';
import 'package:multisuministros/pages/login_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'loginPage': ( _ ) => const LoginPage(),
  };