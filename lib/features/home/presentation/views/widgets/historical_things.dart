import 'package:dalel/features/home/presentation/views/widgets/custom_header_text.dart';
import 'package:flutter/cupertino.dart';

import 'custom_category_list_view_item.dart';

class HistoricalThings extends StatelessWidget {
  const HistoricalThings(
      {super.key,
      required this.text,
      required this.assetName,
      required this.headerText});
  final String text, assetName, headerText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        CustomHeaderText(text: headerText),
        CustomCategoryListViewItem(assetName: assetName, text: text),
      ],
    );
  }
}
