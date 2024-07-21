import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key, required this.text, required this.assetName});
  final String text, assetName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 96,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 7),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 47,
              width: 63,
              child: Text(
                text,
                style: AppStyles.poppins400style16.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.deepBrown),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                height: 64,
                width: 47,
                decoration:  BoxDecoration(
                    image: DecorationImage(image: AssetImage(assetName)))),
          ],
        ),
      ),
    );
  }
}
