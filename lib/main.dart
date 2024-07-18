import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Dalel());
}

class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
      scaffoldBackgroundColor: AppColors.offWhite
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'Dalel',
    );
  }
}

