import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/services/auth.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/pages/auth/auth_page.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/pages/bottom_nav_bar_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return ChangeNotifierProvider<AuthController>(
                  create: (_) => AuthController(auth: auth),
                  child: const AuthPage());
            }
            return const BottomNavBarPage();
          }
          // TODO : WILL ME MAKE PAGE FOR LOODING
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
