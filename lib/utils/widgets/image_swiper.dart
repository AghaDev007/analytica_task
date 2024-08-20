import 'package:analytica_task/views/home/home/controller/home_controller.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analytica_task/utils/app_images.dart';
import 'package:analytica_task/utils/gaps.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSwiper extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (homeController.products.isEmpty) {
        return Center(child: Text('No products available'));
      } else {
        return Column(
          children: [
            SizedBox(
              width: 335.50,
              height: 180.96,
              child: Swiper(
                itemBuilder: (context, index) {
                  final product = homeController.products[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        product.image,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Icon(Icons.broken_image),
                        ),
                      ),
                    ),
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                onIndexChanged: (index) {
                  homeController.myCurrentIndex.value = index;
                },
                itemCount: homeController.products.length,
              ),
            ),
            verticalGap(10),
            Obx(() => AnimatedSmoothIndicator(
                  activeIndex: homeController.myCurrentIndex.value,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 10,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.orange.shade700,
                    paintStyle: PaintingStyle.fill,
                  ),
                )),
          ],
        );
      }
    });
  }
}
