import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/widgets/main_button.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthController(auth: auth),
      child: Consumer<AuthController>(
        builder: (_, model, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MainButton(onPressed: () {
                model.signOut();
              }, text: 'Sign Out')
            ],
          );
        },
      ),
    );
  }
}
