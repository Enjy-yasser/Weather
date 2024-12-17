

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:weather_app/crud.dart';
import 'package:weather_app/permission_req.dart';
import 'package:weather_app/screens/signup_screen.dart';
import 'package:weather_app/search.dart';

import '../screens/homeScreen/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';

class Routes{
  static const String splashRoute='/';
  static const String homeRoute='/Home';
  static const String loginRoute = '/login';
  static const String signUpRoute = '/signUp';
  static const String permissionRoute = '/permission';
  static const String crudRoute = '/crud';
  static const String searchRoute = '/search';

  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              SemanticsService.announce(
                "Splash Screen Loaded Please wait", TextDirection.ltr
              );
            });
            return const SplashScreen();
          },
        );
      case loginRoute:
        return MaterialPageRoute(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              SemanticsService.announce(
                "Login Screen. Enter your credentials to log in.",TextDirection.ltr
              );
            });
            return const LoginScreen();
          },
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              SemanticsService.announce(
                "Home Screen loaded.",TextDirection.ltr
              );
            });
            return const HomeScreen();
          },
        );
      case permissionRoute:
        return MaterialPageRoute(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              SemanticsService.announce(
                  "Permission Screen loaded",TextDirection.ltr
              );
            });
            return const PermissionReq();
          },
        );case searchRoute:
        return MaterialPageRoute(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              SemanticsService.announce(
                  "Permission Screen loaded",TextDirection.ltr
              );
            });
            return  WeatherDownloadPage();
          },
        );

      case signUpRoute:
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        );
        case crudRoute:
        return MaterialPageRoute(
          builder: (context) =>  Crud(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              SemanticsService.announce(
                "Home Screen loaded. Default navigation.",
                  TextDirection.ltr
              );
            });
            return const HomeScreen();
          },
        );
    }
  }

}
