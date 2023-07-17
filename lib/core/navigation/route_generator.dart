import 'package:f35/features/auth/screens/loginScreen.dart';
import 'package:f35/features/auth/screens/registrationScreen.dart';
import 'package:f35/home/screens/homepage.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/signin':
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (context) => RegistrationScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text("Not found ${settings.name}"),
                  ),
                ));
    }
  }
}
