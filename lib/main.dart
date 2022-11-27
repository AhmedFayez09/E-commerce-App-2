import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/routes/router.dart';
import 'package:flutter_ecommerce/core/utils/routes/routes_name.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce App',
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFE5E5E5),
            primaryColor: Colors.red,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: Theme.of(context).textTheme.subtitle1,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          onGenerateRoute: onGenerate,
          initialRoute: RoutesName.loginPageRoute,
        );
      },
    );
  }
}