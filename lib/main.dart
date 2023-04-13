import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/config/theme.dart';
import 'package:task_app/core/service/service_locator.dart';
import 'package:task_app/features/auth/presentation/screens/log_in_screen.dart';

void main() {
  runApp(const MyApp());
  setUpServiceLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MY GALLERY',
          theme:AppTheme.theme(),
          home:const LogInScreen(),
        );
      },
    );
  }
}
