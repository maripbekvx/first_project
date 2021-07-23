import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/router/routing_const.dart';
import 'package:flutter_app/src/screens/auth/auth_screen.dart';
import 'package:flutter_app/src/screens/main/main_screen.dart';
import 'package:flutter_app/src/screens/register/register_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
      case RegisterRoute:
        return CupertinoPageRoute(
          builder: (context) => RegisterScreen(),
        );
      case MainRoute:
        return CupertinoPageRoute(
          builder: (context) => MainScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
    }
  }
}
