import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/routes/router.dart';
import 'package:flutter_ecommerce/core/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'core/utils/app_colors.dart';
import 'feature/ecommerce_app/services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Provider<AuthBase>(
          create: (_) => Auth(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Ecommerce App',
            theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xFFE5E5E5),
              primaryColor: Colors.red,
              appBarTheme: const AppBarTheme(
                 elevation: 0,
                backgroundColor: AppColors.wColor,
                centerTitle: true,
                iconTheme: IconThemeData(
                  color: AppColors.blackColor,
                ),
              ),
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
            initialRoute: RoutesName.landingPageRoute,
          ),
        );
      },
    );
  }
}
