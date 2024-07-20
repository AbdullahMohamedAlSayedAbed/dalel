import 'package:dalel/core/utils/app_images.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_forgot_password_form.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 64, bottom: 40),
                child: Text(
                  "Forgot Password",
                  style: AppStyles.poppins600style24,
                ),
              ),
              SizedBox(
                height: 235,
                width: 235,
                child: Image.asset(Assets.imagesForgotPassword)),
              const SizedBox(height: 24),
              Text(
                'Enter your registered email below to receive password reset instruction',
                style: AppStyles.poppins400style16.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              CustomForgotPasswordForm()
            ],
          ),
        ),
      ),
    ));
  }
}
