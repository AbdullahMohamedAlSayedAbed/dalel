import 'package:dalel/core/utils/app_router.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.signIn);
            },
            child: Text(
              AppStrings.loginNow,
              style: AppStyles.poppins400style16.copyWith(
                decoration: TextDecoration.underline,
              ),
            )),
        const SizedBox(height: 7),
      ],
    );
  }
}
