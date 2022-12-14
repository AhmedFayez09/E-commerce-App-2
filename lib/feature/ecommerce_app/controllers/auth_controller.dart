import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/core/utils/constants.dart';
import 'package:flutter_ecommerce/core/utils/enums/auth_enums.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/controllers/database_controller.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/models/user_data.dart';
import '../services/auth.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;
  //TODO : It's not best practice thing but it's temporary
  final Database database = FirestoreDatabase('123');

  AuthController({
    required this.auth,
    this.email = '',
    this.password = '',
    this.authFormType = AuthFormType.login,
  });

  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.loginWithEmailAndPassword(email: email, password: password);
      } else {
        
      final user =  await auth.signUpWithEmailAndPassword(email: email, password: password);
        await database.setUserData(
          UserData(
            uid: user!.uid ?? documentIdFromLocalData(),
            email: email,
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  void signOut() async {
    await auth.signOut();
  }

  void toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWith(
      email: '',
      password: '',
      authFormType: formType,
    );
  }

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  void copyWith({
    String? email,
    String? password,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }
}
