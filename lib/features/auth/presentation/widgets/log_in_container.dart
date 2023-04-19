import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_routes.dart';
import 'package:task_app/core/widgets/custom_button.dart';
import 'package:task_app/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:task_app/features/auth/data/cache/app_secure_storage.dart';
import 'package:task_app/features/auth/presentation/widgets/custom_text_field.dart';

class LogInContainer extends StatefulWidget {
  const LogInContainer({super.key});

  @override
  State<LogInContainer> createState() => _LogInContainerState();
}

class _LogInContainerState extends State<LogInContainer> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UserLogedInSuccessfully) {
          AppSecureStorage.instance
              .saveCurrentUserData(key: 'TOKEN', data: state.loginModel.token!);
          Navigator.pushReplacementNamed(context, AppRoutes.galleryScreen,
              arguments: state.loginModel.token);
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(20.r),
          width: double.maxFinite,
          height: 300.h,
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Theme.of(context).cardColor.withOpacity(0.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Log in',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              CustomTextField(
                  hintText: 'User Name', controller: emailController),
              CustomTextField(
                  hintText: 'Password', controller: passwordController),
              CustomButton(
                  onPressed: () {
                    context.read<AuthCubit>().loginAndGetUserData(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  text: 'Submit')
            ],
          ),
        );
      },
    );
  }
}
