import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.labelText});
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        cursorColor: AppColors.deepBrown,
        decoration: InputDecoration(
            labelStyle: AppStyles.poppins500style14,
            border: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            label:  Text(labelText)),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: AppColors.deepBrown),
    );
  }
}
