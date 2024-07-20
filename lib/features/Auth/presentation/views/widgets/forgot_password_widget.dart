import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.forgotPassword);
        },
        child: Text(
          'Forgot Password ?',
          style: AppStyles.poppins600style24.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
