import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/widgets/image/svg_image_widget.dart';
import 'package:analytica_task/views/cart/controller/cart_controller.dart';
import 'package:analytica_task/views/home/main/controller/main_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigationBarItem extends StatelessWidget {
  String? label;
  int? index;
  String? icon;

  CustomNavigationBarItem({
    this.label,
    this.index,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainHomeController>();
    final CartController controllerc = Get.find<CartController>();

    return InkWell(
      onTap: () {
        controller.changeTabIndex(index!);
        controllerc.fetchCartItems();
      },
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgImageWidget(
              image: icon,
              height: 21,
              color: controller.tabIndex == index
                  ? AppTheme.primary
                  : AppTheme.grey,
            ),
          ],
        ),
      ),
    );
  }
}
