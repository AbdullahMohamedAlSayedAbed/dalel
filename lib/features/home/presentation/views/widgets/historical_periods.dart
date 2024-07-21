import 'package:dalel/core/utils/app_images.dart';
import 'package:dalel/features/home/presentation/views/widgets/historical_period_item.dart';
import 'package:flutter/material.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalPeriodItem(assetName: Assets.imagesPyramidLaft,text:'Ancient Egypt'),
        HistoricalPeriodItem(
            assetName: Assets.imagesIslamic, text: 'Islamic Era '),
      ],
    );
  }
}
