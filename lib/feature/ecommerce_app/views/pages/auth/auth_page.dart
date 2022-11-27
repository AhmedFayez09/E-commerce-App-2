import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/app_strings/app_strings.dart';
import 'package:flutter_ecommerce/core/utils/app_strings/images_path.dart';
import 'package:flutter_ecommerce/core/utils/enums/auth_enums.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/services/auth.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/widgets/main_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/routes/routes_name.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passWordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if (!mounted) return;
      Navigator.pushNamed(context, RoutesName.bottomNavBarRoute);
    } catch (e) {
      //// TODO : WE WILL REFACTOR THIS CODE INTO ANOTHER WIDGET

      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(
                  'Error',
                  style: Theme.of(context).textTheme.headline6,
                ),
                content: Text(
                  e.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return Consumer<AuthController>(
      builder: (_, model, __) {
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
                        model.authFormType == AuthFormType.login
                            ? AppStrings.login
                            : AppStrings.register,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 12.h),
                      TextFormField(
                        onChanged: model.updateEmail,
                        focusNode: _emailFocusNode,
                        controller: _emailController,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passWordFocusNode),
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
                        obscureText: true,
                        onChanged: model.updatePassword,
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
                      if (model.authFormType == AuthFormType.login)
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
                            _submit(model);
                          }
                        },
                        text: model.authFormType == AuthFormType.login
                            ? AppStrings.login
                            : AppStrings.register,
                      ),
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            _formKey.currentState!.reset();
                            model.toggleFormType();
                          },
                          child: Text(
                            model.authFormType == AuthFormType.login
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
                          model.authFormType == AuthFormType.login
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
                            child:
                                Image.asset(AppImagesPathAssets.googlePath),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                            padding: EdgeInsets.all(3.h),
                            margin: EdgeInsets.all(1.h),
                            child:
                                Image.asset(AppImagesPathAssets.faceBookPath),
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
      },
    );
  }
}
