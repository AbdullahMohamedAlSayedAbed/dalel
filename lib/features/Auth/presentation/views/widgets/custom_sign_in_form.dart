import 'package:dalel/core/functions/custom_toast_message.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_router.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:dalel/features/Auth/presentation/views/functions/validate_email_functions.dart';
import 'package:dalel/features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:dalel/features/Auth/presentation/views/widgets/forgot_password_widget.dart';
import 'package:dalel/features/Auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          showToastMessage(
              message: state.errMessage, backgroundColor: Colors.red);
        }
        if (state is SignInSuccess) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? GoRouter.of(context).pushReplacement(AppRouter.home)
              : showToastMessage(
                  message: "please verify your email",
                  backgroundColor: Colors.red);
          showToastMessage(
              message: "Sign In Success,welcome back",
              backgroundColor: AppColors.deepBrown);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: AuthCubit.get(context).formSignInKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CustomTextFormField(
                      icon: Icons.email,
                      validator: (value) {
                        return validateEmailFunctions(value);
                      },
                      onChanged: (value) {
                        AuthCubit.get(context).emailAddress = value;
                      },
                      labelText: AppStrings.emailAddress),
                  CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Password";
                        }
                        return null;
                      },
                      obscureText: AuthCubit.get(context).isPasswordVisible,
                      icon: Icons.lock,
                      iconButton: AuthCubit.get(context).suffix,
                      onPressedSuffixIcon: () {
                        AuthCubit.get(context).changePasswordVisibility();
                      },
                      onChanged: (value) {
                        AuthCubit.get(context).password = value;
                      },
                      labelText: AppStrings.password),
                  const ForgotPasswordWidget(),
                  const SizedBox(height: 100),
                  state is SignInLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ))
                      : CustomButton(
                          text: 'Sign In',
                          onPressed: () {
                            if (AuthCubit.get(context)
                                .formSignInKey
                                .currentState!
                                .validate()) {
                              AuthCubit.get(context)
                                  .signInWithEmailAndPassword();
                            }
                          }),
                  HaveAnAccountWidget(
                      text: 'Don\'t have an account',
                      textButton: "Sign Up",
                      onPressed: () {
                        GoRouter.of(context).pop();
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
