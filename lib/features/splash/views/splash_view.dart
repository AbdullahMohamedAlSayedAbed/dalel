import 'package:dalel/constants.dart';
import 'package:dalel/core/utils/app_router.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/cache/cache_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardVisited = CacheHelper.getData(key: onBoardVisit) ?? false;
    if (isOnBoardVisited) {
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigate(AppRouter.signUp)
          : delayedNavigate(AppRouter.home);
    } else {
      delayedNavigate(AppRouter.onBoarding);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(AppStrings.appName, style: AppStyles.pacifico400style64),
      ),
    );
  }

  void delayedNavigate(String view) {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacement(view);
    });
  }
}
