import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

class CustomCheckSignUpLoadingAndButton extends StatelessWidget {
  const CustomCheckSignUpLoadingAndButton({super.key, required this.state});
  final AuthState state;
  @override
  Widget build(BuildContext context) {
    return state is SignUpLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ))
        : CustomButton(
            backgroundColor: AuthCubit.get(context).termsAndConditionBox
                ? AppColors.primaryColor
                : Colors.grey,
            text: AppStrings.signUp,
            onPressed: () {
              if (AuthCubit.get(context).termsAndConditionBox) {
                if (AuthCubit.get(context).formSignUpKey.currentState!.validate()) {
                  AuthCubit.get(context).signUpWithEmailAndPassword();
                }
              }
            },
          );
  }
}
