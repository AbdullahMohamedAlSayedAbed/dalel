import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_sign_in_form.dart';
import 'widgets/welcome_banner.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WelcomeBanner(),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 48),
              child: Text(
                AppStrings.welcomeBack,
                style: AppStyles.poppins600style24,
              ),
            ),
            CustomSignInForm(),
          ],
        ),
      ),
    );
  }
}
