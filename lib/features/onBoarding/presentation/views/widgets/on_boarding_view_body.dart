import 'package:dalel/core/cache/cache_helper.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'custom_smooth_page_indicator.dart';
import 'custom_text_button.dart';
import 'on_boarding_page_view_widget.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late final PageController _controller;
  int currentIndex = 0;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 84),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        CacheHelper.saveData(
                            key: "isOnBoardVisited", value: true);
                        GoRouter.of(context).pushReplacement(AppRouter.signUp);
                      },
                      child: const Text(AppStrings.skip,
                          style: AppStyles.poppins400style16),
                    )),
                SizedBox(
                  height: 500,
                  child: Stack(
                    children: [
                      OnBoardingPageViewWidget(
                        onPageChanged: (value) {
                          currentIndex = value;
                          setState(() {});
                        },
                        controller: _controller,
                      ),
                      Positioned(
                          top: 290 + 24,
                          left: MediaQuery.sizeOf(context).width / 2 - 70,
                          child: CustomSmoothPageIndicator(
                              controller: _controller)),
                    ],
                  ),
                ),
                const SizedBox(height: 88),
                CustomButton(
                  text: currentIndex == 2
                      ? AppStrings.createAccount
                      : AppStrings.next,
                  onPressed: () {
                    if (currentIndex < 2) {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    } else {
                       CacheHelper.saveData(
                          key: "isOnBoardVisited", value: true);
                      GoRouter.of(context).pushReplacement(AppRouter.signUp);
                    }
                  },
                ),
                const SizedBox(height: 18),
                if (currentIndex == 2) const CustomTextButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
