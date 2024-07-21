import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:dalel/features/cart/presentation/views/cart_view.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';

import '../../../../../core/utils/app_colors.dart';

final PersistentTabController _controller =
    PersistentTabController(initialIndex: 0);

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style13,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
    );
  }

  List<Widget> _buildScreens() {
    return const [
      HomeView(),
      CartView(),
      SearchView(),
      ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        inactiveIcon: const Icon(Icons.home_outlined),
        activeColorPrimary: AppColors.deepBrown,
        inactiveColorPrimary: AppColors.deepBrown,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        inactiveIcon: const Icon(Icons.shopping_cart_outlined),
        activeColorPrimary: AppColors.deepBrown,
        inactiveColorPrimary: AppColors.deepBrown,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search_sharp),
        inactiveIcon: const Icon(Icons.search),
        activeColorPrimary: AppColors.deepBrown,
        inactiveColorPrimary: AppColors.deepBrown,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        inactiveIcon: const Icon(Icons.person_outlined),
        activeColorPrimary: AppColors.deepBrown,
        inactiveColorPrimary: AppColors.deepBrown,
      ),
    ];
  }
}
