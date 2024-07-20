import 'package:dalel/core/functions/custom_toast_message.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_router.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:dalel/features/Auth/presentation/views/functions/validate_email_functions.dart';
import 'package:dalel/features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:dalel/features/Auth/presentation/views/widgets/terms_and_conditions_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_check_sign_up_loading_and_button.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          showToastMessage(
              message: state.errMessage, backgroundColor: Colors.red);
        }
        if (state is SignUpSuccess) {
          showToastMessage(
              message: "Sign Up Success", backgroundColor: AppColors.deepBrown);
          GoRouter.of(context).pushReplacement(AppRouter.home);
        }
      },
      builder: (context, state) {
        return Form(
          key: AuthCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextFormField(
                  icon: Icons.person,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your First Name";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    AuthCubit.get(context).fistName = value;
                  },
                  labelText: AppStrings.firstName),
              CustomTextFormField(
                  icon: Icons.person,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your last Name";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    AuthCubit.get(context).lastName = value;
                  },
                  labelText: AppStrings.lastName),
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
                  obscureText: AuthCubit.get(context).isPasswordVisible,
                  icon: Icons.lock,
                  iconButton: AuthCubit.get(context).suffix,
                  onPressedSuffixIcon: () {
                    AuthCubit.get(context).changePasswordVisibility();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Password";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    AuthCubit.get(context).password = value;
                  },
                  labelText: AppStrings.password),
              const TermsAndConditionWidget(),
              const SizedBox(height: 90),
              CustomCheckSignUpLoadingAndButton(state: state),
            ],
          ),
        );
      },
    );
  }
}
