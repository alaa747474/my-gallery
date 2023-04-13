import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_assets.dart';
import 'package:task_app/core/service/service_locator.dart';
import 'package:task_app/core/widgets/app_background.dart';
import 'package:task_app/features/auth/data/repositories/auth_repository.dart';
import 'package:task_app/features/auth/presentation/widgets/log_in_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/auth_cubit.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepository>()),
      child: Scaffold(
        body: AppBackground(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 70.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Image.asset(AppAssets.camera),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Center(
                      child: Text(
                    'My\nGallary',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge,
                  )),
                ),
                const LogInContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
