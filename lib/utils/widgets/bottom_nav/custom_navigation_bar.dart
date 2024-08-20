import 'package:analytica_task/utils/app_icons.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/widgets/bottom_nav/custom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        height: 53,
        padding: EdgeInsets.symmetric(horizontal: context.width * .058),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppTheme.white,
            boxShadow: [const BoxShadow(blurRadius: 10, color: AppTheme.black26)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomNavigationBarItem(
              label: 'home',
              index: 0,
              icon: AppIcons.home,
            ),
            const SizedBox(
              height: 20,
              child: VerticalDivider(
                thickness: 0.5,
              ),
            ),
            // horizontalGap(context.width * 0.5),
            CustomNavigationBarItem(
              label: 'History',
              index: 1,
              icon: AppIcons.offers,
            ),
          ],
        ),
      ),
    );
  }
}
