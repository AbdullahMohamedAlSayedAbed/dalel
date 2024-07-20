import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Checkbox(
              activeColor: AppColors.deepBrown,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              side: const BorderSide(color: Colors.grey),
              value: BlocProvider.of<AuthCubit>(context).termsAndConditionBox,
              onChanged: (value) {
                BlocProvider.of<AuthCubit>(context)
                    .updateTermsAndConditionBox(value: value!);
              },
            );
          },
        ),
        const Text(
          "I have agree to our Terms and Condition",
          style: AppStyles.poppins400style12,
        )
      ],
    );
  }
}
