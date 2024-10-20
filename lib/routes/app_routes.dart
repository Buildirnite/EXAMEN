import 'package:flutter/material.dart';
import '../screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'list';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'add_user': (BuildContext context) => const RegisterUserScreen(),
    'list': (BuildContext context) => const ListProductScreen(),
    'edit': (BuildContext context) => const EditProductScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
