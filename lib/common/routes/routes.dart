import 'package:courses_eshop_app/features/home_main/view/home_screen.dart';
import 'package:courses_eshop_app/features/sign_in/view/sign_in_screen.dart';
import 'package:courses_eshop_app/features/sign_up/view/sign_up_screen.dart';
import 'package:courses_eshop_app/features/welcome/view/welcome_screen.dart';
import 'package:courses_eshop_app/global.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// final AppRoutes = {
//   WelcomeScreen.kRoute: (context) => WelcomeScreen(),
//   SignInScreen.kRoute: (context) => SignInScreen(),
//   SignUpScreen.kRoute: (context) => SignUpScreen(),
//   HomeScreen.kRoute: (context) => HomeScreen(),
// };

class AppScreens {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(WelcomeScreen.kRoute, WelcomeScreen()),
      RouteEntity(SignInScreen.kRoute, SignInScreen()),
      RouteEntity(SignUpScreen.kRoute, SignUpScreen()),
      RouteEntity(HomeScreen.kRoute, HomeScreen()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print('navigated to route ${settings.name}');
    }

    RouteEntity? result;

    if (settings.name != null) {
      if (settings.name == WelcomeScreen.kRoute) {
        bool isLoggedIn = Global.storageService.isLoggedIn();

        if (isLoggedIn) {
          return MaterialPageRoute(builder: (_) => HomeScreen(), settings: settings);
        }

        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();

        if (deviceFirstTime) {
          return MaterialPageRoute(builder: (_) => SignInScreen(), settings: settings);
        }
      }

      result = routes().firstWhere((element) => element.path == settings.name);
    }

    if (result != null) {
      return MaterialPageRoute(builder: (_) => result!.screen, settings: settings);
    }

    return MaterialPageRoute(builder: (_) => WelcomeScreen(), settings: settings);
  }
}

class RouteEntity {
  final String path;
  final Widget screen;

  RouteEntity(this.path, this.screen);
}
