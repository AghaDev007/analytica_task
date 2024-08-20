import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/widgets/bottom_nav/custom_navigation_bar.dart';
import 'package:analytica_task/views/cart/controller/cart_controller.dart';
import 'package:analytica_task/views/cart/view/cart_view.dart';
import 'package:analytica_task/views/home/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_home_controller.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainHomeController>();
    final CartController controllerc = Get.find<CartController>();

    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Obx(() {
        if (controller.tabIndex.value == 0) {
          return const HomeView();
        }
        if (controller.tabIndex.value == 1) {
          return CartView();
        }

        return Container();
      }),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
