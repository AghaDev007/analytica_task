import 'package:analytica_task/models/products_model.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/gaps.dart';
import 'package:analytica_task/utils/text_styles.dart';
import 'package:analytica_task/utils/widgets/button_widget.dart';
import 'package:analytica_task/views/product_detail/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailController());

    return Obx(() => ModalProgressHUD(
          inAsyncCall: controller.loading.value,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Text(product.category.toUpperCase()),
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      product.image,
                      height: 270,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.title.length > 20
                        ? '${product.title.substring(0, 20)}...'
                        : product.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.title.length > 36
                        ? '${product.title.substring(0, 36)}...'
                        : product.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppTheme.yellow,
                            ),
                            horizontalGap(5),
                            Text(product.rating.rate.toString())
                          ],
                        ),
                      ]),
                  verticalGap(60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonWidget(
                        stringText: "+",
                        width: context.width * 0.25,
                        height: 46,
                        onPressFunction: () => controller.increment(),
                      ),
                      Obx(
                        () => Container(
                          width: context.width * 0.2,
                          height: 46,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppTheme.primary)),
                          child: Center(
                            child: Text(
                              controller.quantity.value.toString(),
                              style: TextStyles.primary714,
                            ),
                          ),
                        ),
                      ),
                      ButtonWidget(
                        stringText: "-",
                        onPressFunction: () => controller.decrement(),
                        width: context.width * 0.25,
                        height: 46,
                      ),
                    ],
                  ),
                  verticalGap(context.height * 0.055),
                  Center(
                    child: ButtonWidget(
                      stringText: "Add to Cart",
                      onPressFunction: () async {
                        controller.addToCart(product);
                      },
                      width: context.width * 0.8,
                      height: 46,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
