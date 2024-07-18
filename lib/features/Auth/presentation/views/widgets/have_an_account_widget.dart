import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget(
      {super.key,
      this.onPressed,
      required this.text,
      required this.textButton});
  final void Function()? onPressed;
  final String text, textButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          TextButton(onPressed: onPressed, child: Text(textButton,style: AppStyles.poppins400style12,))
        ],
      ),
    );
  }
}
