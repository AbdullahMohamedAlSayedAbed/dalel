import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/Auth/presentation/views/widgets/terms_and_conditions_widgets.dart';
import 'package:dalel/features/Auth/presentation/views/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import 'widgets/custom_sign_up_form.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/have_an_account_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 108),
              const WelcomeTextWidget(text: 'Welcome !'),
              const SizedBox(height: 40),
              const CustomSignUpForm(),

              HaveAnAccountWidget(
                text: AppStrings.alreadyHaveAnAccount,
                textButton: AppStrings.signIn,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.signIn);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
