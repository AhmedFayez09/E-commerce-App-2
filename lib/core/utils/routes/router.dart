import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/routes/routes_name.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/pages/auth/auth_page.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/pages/bottom_nav_bar_page.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/pages/landing_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.loginPageRoute:
      return MaterialPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings
      );
    case RoutesName.bottomNavBarRoute:
      return MaterialPageRoute(
        builder: (_) => const BottomNavBarPage(),
          settings: settings
      );

    case RoutesName.landingPageRoute:
    default:
      return MaterialPageRoute(
        builder: (_) => const LandingPage(),
          settings: settings
      );
  }
}
