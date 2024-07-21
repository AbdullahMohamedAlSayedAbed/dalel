import 'package:dalel/core/utils/app_images.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'widgets/custom_header_text.dart';
import 'widgets/custom_home_app_bar.dart';
import 'widgets/historical_periods.dart';
import 'widgets/historical_periods_section.dart';
import 'widgets/historical_things.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: CustomHomeAppBar()),
              SliverToBoxAdapter(child: HistoricalPeriodsSection()),
              SliverToBoxAdapter(
                  child: HistoricalThings(
                assetName: Assets.imagesRichardCoeurDeLion,
                text: 'Lionheart',
                headerText: 'Historical Characters',
              )),
              SliverToBoxAdapter(
                  child: HistoricalThings(
                assetName: Assets.imagesRichardCoeurDeLion,
                text: 'Lionheart',
                headerText: 'Historical Souvenirs',
              )),
            ],
          ),
        ),
      ),
    );
  }
}
