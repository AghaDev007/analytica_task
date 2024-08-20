import 'package:analytica_task/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analytica_task/models/offers_model.dart';
import 'package:analytica_task/utils/app_images.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/gaps.dart';
import 'package:analytica_task/utils/text_styles.dart';
import 'package:analytica_task/utils/widgets/image/image_widget.dart';

class FunctionalTileWidget extends StatelessWidget {
  const FunctionalTileWidget(
      {this.name,
      this.image,
      super.key,
      this.onTap,
      this.price,
      this.discounted,
      required this.offer});

  final String? image, name, price, discounted;
  final Function()? onTap;
  final ProductsModel offer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width * .426,
        height: context.height * 0.115,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(offer.image), fit: BoxFit.fill),
            boxShadow: [
              const BoxShadow(blurRadius: 15, color: AppTheme.black26)
            ],
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(15.19)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15.19),
                    bottomLeft: Radius.circular(15.19),
                  ),
                  color: AppTheme.black.withOpacity(0.5)),
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: TextStyles.white612,
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      "Starting from",
                      style: TextStyles.white508,
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        Text(
                          "AED ${offer.price}",
                          style: TextStyles.green610,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "AED ${offer.price}",
                          style: TextStyles.white610l,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FunctionalTileTopRated extends StatelessWidget {
  const FunctionalTileTopRated(
      {this.name,
      this.image,
      super.key,
      this.onTap,
      this.start,
      this.end,
      this.rating});

  final String? image, name, start, end, rating;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width * .5,
        // height: context.height * 0.165,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(image!), fit: BoxFit.fill),
            boxShadow: [
              const BoxShadow(blurRadius: 15, color: AppTheme.black26)
            ],
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(15.19)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              width: context.width * .5,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15.19),
                    bottomLeft: Radius.circular(15.19),
                  ),
                  color: AppTheme.black.withOpacity(0.5)),
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: TextStyles.white610,
                      textAlign: TextAlign.left,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0, right: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$start min",
                            style: TextStyles.white508,
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            height: 15,
                            width: 25,
                            color: Colors.green,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  rating!,
                                  style: TextStyles.white508,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: AppTheme.white,
                                  size: 8,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
