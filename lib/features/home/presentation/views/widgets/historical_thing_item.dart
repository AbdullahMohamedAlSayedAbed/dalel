import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HistoricalThingItem extends StatelessWidget {
  const HistoricalThingItem({
    super.key,
    required this.assetName,
    required this.text,
  });

  final String assetName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 133,
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
      child: Column(
        children: [
          Container(
              height: 96,
              width: 74,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(assetName)))),
          const Spacer(),
          Text(
            text,
            style: AppStyles.poppins500style14
                .copyWith(color: AppColors.deepBrown),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
