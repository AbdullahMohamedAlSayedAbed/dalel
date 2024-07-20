import 'package:dalel/core/utils/app_images.dart';
import 'package:dalel/features/onBoarding/data/models/onBoarding_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class OnBoardingPageViewWidget extends StatelessWidget {
  const OnBoardingPageViewWidget({super.key, this.controller, this.onPageChanged});
  final PageController? controller;
  final void Function(int)? onPageChanged;
  static const List<OnBoardingModel> _onBoardingList = [
    OnBoardingModel(
        image: Assets.imagesOnBoarding1,
        title: 'Explore The history with Dalel in a smart way',
        description:
            'Using our app’s history libraries you can find many historical periods'),
    OnBoardingModel(
        image: Assets.imagesOnBoarding2,
        title: 'From every place on earth',
        description: 'A big variety of ancient places from all over the world'),
    OnBoardingModel(
        image: Assets.imagesOnBoarding3,
        title: 'Using modern AI technology for better user experience',
        description:
            'AI provide recommendations and helps you to continue the search journey'),
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      physics: const BouncingScrollPhysics(),
      controller: controller,
      itemCount: _onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
                height: 290,
                width: double.infinity,
                child:
                    Image.asset(_onBoardingList[index].image, fit: BoxFit.fill)),
            const SizedBox(height: 76),
            Text(
              _onBoardingList[index].title,
              style: AppStyles.poppins600style24
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Text(
              _onBoardingList[index].description,
              style: AppStyles.poppins400style16,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
    );
  }
}
