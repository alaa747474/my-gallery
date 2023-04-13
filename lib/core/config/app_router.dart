import 'package:flutter/material.dart';
import 'package:task_app/core/constants/app_routes.dart';
import 'package:task_app/features/auth/presentation/screens/log_in_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case AppRoutes.logInScreen:
        return MaterialPageRoute(builder:(context) => const LogInScreen());
    }
    return null;
  }
}