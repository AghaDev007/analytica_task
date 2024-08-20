import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/app_images.dart';
import '../../../../utils/widgets/image/image_widget.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        color: AppTheme.white,
        child: Center(
          child: ImageWidget(
            image: AppImages.logo1,
            fit: BoxFit.fill,
            width: context.width * .43,
          ),
        ),
      ),
    );
  }
}
