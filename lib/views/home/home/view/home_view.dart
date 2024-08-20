import 'package:analytica_task/utils/app_icons.dart';
import 'package:analytica_task/utils/dialog/dialogs.dart';
import 'package:analytica_task/utils/widgets/image/svg_image_widget.dart';
import 'package:analytica_task/views/home/main/controller/main_home_controller.dart';
import 'package:analytica_task/views/product_detail/product_detail_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/gaps.dart';
import 'package:analytica_task/utils/text_styles.dart';
import 'package:analytica_task/utils/widgets/functional_tile_widgets.dart';
import 'package:analytica_task/utils/widgets/image_swiper.dart';
import 'package:analytica_task/views/home/home/controller/home_controller.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final main = Get.find<MainHomeController>();

    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                verticalGap(context.height * .07),
                Row(
                  children: [
                    const Icon(Icons.location_pin, color: AppTheme.primary),
                    horizontalGap(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _auth.currentUser!.email!.length > 16
                              ? '${_auth.currentUser!.email!.substring(0, 16)}...'
                              : _auth.currentUser!.email!,
                          style: TextStyles.black514,
                        ),
                        const Text(
                          'Dubai',
                          style: TextStyles.lightPrimary512,
                        )
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        main.tabIndex.value = 1;
                      },
                      child: Card(
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(blurRadius: 3, offset: Offset(0, 2))
                          ], color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.trolley,
                            color: AppTheme.primary,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(blurRadius: 3, offset: Offset(0, 2))
                          ], color: Colors.white, shape: BoxShape.circle),
                          child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const LogOutDialog();
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgImageWidget(
                                  image: AppIcons.logout,
                                ),
                              ))),
                    )
                  ],
                ),
                verticalGap(context.height * .02),
                Center(
                  child: Container(
                    width: Get.width * 0.90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: const Color(0xfff4f4f4), width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),
                      child: TextFormField(
                        onChanged: (c) {
                          controller.searchQuery.value = c;
                        },
                        controller: controller.search,
                        cursorColor: AppTheme.primary,
                        showCursor: true,
                        style: TextStyles.black512.copyWith(
                            color: Colors.black), // Ensure text color is set
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppTheme.primary,
                            size: 30,
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              VerticalDivider(
                                indent: 15,
                                endIndent: 15,
                                color: Colors.black26,
                              ),
                              Icon(
                                Icons.mic,
                                color: AppTheme.primary,
                              ),
                            ],
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                verticalGap(context.height * .025),
                Obx(() => controller.searchQuery.value == ""
                    ? ImageSwiper()
                    : const SizedBox()),
                verticalGap(20),
                Obx(() => controller.searchQuery.value == ""
                    ? const Text(
                        'Categories',
                        style: TextStyles.black516,
                      )
                    : const SizedBox()),
                verticalGap(20),
                Obx(() => controller.searchQuery.value == ""
                    ? Container(
                        alignment: Alignment.center,
                        width: 335,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x196F55A6),
                              blurRadius: 20,
                              offset: Offset(0, 2),
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: controller.exercises
                              .map(
                                (exercise) => Column(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  exercise['reps']!))),
                                    ),
                                    Text(
                                      exercise['catName']!,
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      )
                    : const SizedBox()),
                verticalGap(context.height * .01),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Offers",
                      style: TextStyles.grey614,
                    ),
                    Text(
                      "View All",
                      style: TextStyles.grey512,
                    )
                  ],
                ),
                SizedBox(height: context.height * .01),
                Obx(() {
                  if (controller.products.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 5 / 5,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        final product = controller.products[index];
                        return Obx(() => product.title
                                .toLowerCase()
                                .contains(controller.searchQuery.value)
                            ? FunctionalTileWidget(
                                offer: product,
                                name: product.title,
                                image: product.image,
                                onTap: () {
                                  Get.to(
                                      () => ProductDetailView(
                                            product: product,
                                          ),
                                      transition: Transition.fadeIn);
                                },
                              )
                            : const SizedBox());
                      },
                    );
                  }
                }),
                SizedBox(height: context.height * .02),
                const Text(
                  "Top Rated Products near you",
                  style: TextStyles.grey614,
                ),
                SizedBox(height: context.height * .02),
                Obx(() {
                  if (controller.products.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox(
                      height: context.height * 0.180,
                      width: context.width,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.products.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          final product = controller.products[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: FunctionalTileTopRated(
                              name: product.title,
                              image: product.image,
                              start: product.category.toString(),
                              end: product.price.toString(),
                              rating: product.rating.rate.toString(),
                              onTap: () {
                                Get.to(
                                    () => ProductDetailView(
                                          product: product,
                                        ),
                                    transition: Transition.fadeIn);
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
                verticalGap(20),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return SizedBox(
                      height: context.height * 0.33,
                      child: ListView.builder(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) {
                            final product = controller.products[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: InkWell(
                                onTap: () {
                                  Get.to(
                                      () => ProductDetailView(
                                            product: product,
                                          ),
                                      transition: Transition.fadeIn);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: context.width - 20,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x196F55A6),
                                        blurRadius: 20,
                                        offset: Offset(0, 2),
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 150,
                                        width: context.width - 20,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                product.image,
                                              ),
                                              fit: BoxFit.fill),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                        ),
                                      ),
                                      verticalGap(10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              product.title.length > 20
                                                  ? '${product.title.substring(0, 20)}...'
                                                  : product.title,
                                              style: TextStyles.black616,
                                            ),
                                            Container(
                                              width: 40,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    product.rating.rate
                                                        .toString(),
                                                    style: TextStyles.white510,
                                                  ),
                                                  const Icon(
                                                    Icons.star,
                                                    color: AppTheme.white,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      verticalGap(10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                product.category,
                                                style: TextStyles.black512,
                                              ),
                                              Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 3,
                                                    backgroundColor:
                                                        Colors.black,
                                                  ),
                                                  horizontalGap(5),
                                                  Text(
                                                    'AED ${product.price} for 1',
                                                    style: TextStyles.black612,
                                                  ),
                                                ],
                                              ),
                                            ]),
                                      ),
                                      verticalGap(5),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.comment,
                                                  color: Colors.blue.shade900,
                                                ),
                                                horizontalGap(5),
                                                Text(
                                                  product.rating.count
                                                      .toString(),
                                                  style: TextStyles.black510,
                                                ),
                                                horizontalGap(10),
                                                const CircleAvatar(
                                                  radius: 3,
                                                  backgroundColor: Colors.black,
                                                ),
                                                horizontalGap(4),
                                                const Text(
                                                  '6.82 km',
                                                  style: TextStyles.black510,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Dubai',
                                                  style: TextStyles.black512,
                                                ),
                                                Icon(
                                                  Icons.location_pin,
                                                  color: Colors.orange.shade700,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      verticalGap(context.height * 0.01)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }));
                }),
                verticalGap(context.height * 0.1)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
