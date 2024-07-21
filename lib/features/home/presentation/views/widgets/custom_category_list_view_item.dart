import 'package:dalel/features/home/presentation/views/widgets/historical_thing_item.dart';
import 'package:flutter/cupertino.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({
    super.key,
    required this.assetName,
    required this.text,
  });

  final String assetName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return HistoricalThingItem(assetName: assetName, text: text);
        },
      ),
    );
  }
}
