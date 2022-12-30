import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/routes/routes_name.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/controllers/database_controller.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/models/product_model.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/pages/auth/auth_page.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/pages/bottom_nav_bar_page.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/pages/landing_page.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/pages/product_details.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/pages/profile_page.dart';
import 'package:provider/provider.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.loginPageRoute:
      return MaterialPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
    case RoutesName.bottomNavBarRoute:
      return MaterialPageRoute(
        builder: (_) => const BottomNavBarPage(),
        settings: settings,
      );
    case RoutesName.profilePageRoute:
      return MaterialPageRoute(
        builder: (_) => const ProfilePage(),
        settings: settings,
      );
    case RoutesName.productDetailsRoute:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args['product'];
      final database = args['database'];
      return MaterialPageRoute(
        builder: (_) => Provider<Database>.value(
          value: database,
          child: ProductDetails(
            productModel: product,
          ),
        ),
        settings: settings,
      );

    case RoutesName.landingPageRoute:
    default:
      return MaterialPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}
