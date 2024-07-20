import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      this.onChanged,
      this.onFieldSubmitted,
      this.validator, this.icon, this.onPressedSuffixIcon, this.iconButton,this.obscureText = false});
  final String labelText;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
 final bool obscureText;
  final void Function()? onPressedSuffixIcon;
  final IconData? iconButton;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitted,
        cursorColor: AppColors.deepBrown,
        decoration: InputDecoration(
            prefixIcon:  Icon(icon, color: AppColors.deepBrown),
            suffixIcon: IconButton(onPressed: onPressedSuffixIcon, icon: Icon(iconButton, color: AppColors.deepBrown)),
            labelStyle: AppStyles.poppins500style14,
            border: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            label: Text(labelText)),
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
