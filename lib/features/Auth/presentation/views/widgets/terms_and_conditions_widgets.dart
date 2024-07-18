import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({super.key});

  @override
  State<TermsAndConditionWidget> createState() =>
      _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  bool newValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.deepBrown,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
          ),
          side: const BorderSide(color: Colors.grey),
          value: newValue,
          onChanged: (value) {
            newValue = value!;
            setState(() {});
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
