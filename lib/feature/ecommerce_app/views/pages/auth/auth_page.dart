import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/app_strings/app_strings.dart';
import 'package:flutter_ecommerce/core/utils/app_strings/images_path.dart';
import 'package:flutter_ecommerce/core/utils/enums/auth_enums.dart';
import 'package:flutter_ecommerce/core/utils/routes/routes_name.dart';

import 'package:flutter_ecommerce/feature/ecommerce_app/views/widgets/main_button.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _authType = AuthFormType.login;
  final _emailFocusNode = FocusNode();
  final _passWordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
            horizontal: 8.w,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _authType == AuthFormType.login
                        ? AppStrings.login
                        : AppStrings.register,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    focusNode: _emailFocusNode,
                    controller: _emailController,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passWordFocusNode),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.validEmail;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                    ),
                  ),
                  SizedBox(height: 3.h),
                  TextFormField(
                    focusNode: _passWordFocusNode,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.validPass;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                    ),
                  ),
                  SizedBox(height: 2.h),
                  if (_authType == AuthFormType.login)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Text(AppStrings.forgetPass),
                              Icon(
                                Icons.arrow_forward_outlined,
                                size: 15.sp,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  SizedBox(height: 2.h),
                  MainButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint('authentication');
                        Navigator.pushNamed(context, RoutesName.bottomNavBarRoute);
                      }
                    },
                    text: _authType == AuthFormType.login
                        ? AppStrings.login
                        : AppStrings.register,
                  ),
                  SizedBox(height: 2.h),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        setState(() {
                          if (_authType == AuthFormType.login) {
                            _authType = AuthFormType.register;
                          } else {
                            _authType = AuthFormType.login;
                          }
                        });
                      },
                      child: Text(
                        _authType == AuthFormType.login
                            ? AppStrings.notHoveAccount
                            : AppStrings.aHoveAccount,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  // const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      _authType == AuthFormType.login
                          ? AppStrings.orLoginWith
                          : AppStrings.orRegisterWith,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        padding: EdgeInsets.all(3.h),
                        margin: EdgeInsets.all(1.h),
                        child: Image.asset(AppImagesPathAssets.googlePath),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        padding: EdgeInsets.all(3.h),
                        margin: EdgeInsets.all(1.h),
                        child: Image.asset(AppImagesPathAssets.faceBookPath),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
