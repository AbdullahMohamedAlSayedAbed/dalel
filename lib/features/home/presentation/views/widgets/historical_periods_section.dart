import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/presentation/views/widgets/custom_header_text.dart';
import 'package:dalel/features/home/presentation/views/widgets/historical_periods.dart';
import 'package:flutter/cupertino.dart';

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalPeriods),
        HistoricalPeriods(),
      ],
    );
  }
}
