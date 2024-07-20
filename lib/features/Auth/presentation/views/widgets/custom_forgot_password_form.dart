import 'package:dalel/core/functions/custom_toast_message.dart';
import 'package:dalel/core/utils/app_router.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:dalel/features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          showToastMessage(
              message: "check your email To reset your password",
              backgroundColor: AppColors.deepBrown);
          GoRouter.of(context).pushReplacement(AppRouter.signIn);
        }
        if (state is ResetPasswordFailure) {
          print(state.errMessage);
          showToastMessage(
              message: state.errMessage, backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        return Form(
          key: AuthCubit.get(context).formForgetKey,
          child: Column(
            children: [
              const SizedBox(height: 41),
              CustomTextFormField(
                labelText: "Email Address",
                icon: Icons.email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Your Email Address";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  AuthCubit.get(context).emailAddress = value;
                },
                onChanged: (value) {
                  AuthCubit.get(context).emailAddress = value;
                },
              ),
              const SizedBox(height: 129),
              state is ResetPasswordLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      text: AppStrings.sendResetPasswordLink,
                      onPressed: () {
                        if (AuthCubit.get(context)
                            .formForgetKey
                            .currentState!
                            .validate()) {
                          AuthCubit.get(context).resetPasswordWithLink();
                        }
                      },
                    ),
              const SizedBox(height: 17),
            ],
          ),
        );
      },
    );
  }
}
