import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analytica_task/utils/app_images.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/text_styles.dart';
import 'package:analytica_task/utils/widgets/image/image_widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    this.text,
    super.key,
    this.image,
    this.onChanged,
  });
  final String? text;
  final String? image;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * .88,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppTheme.lightPrimary2,
      ),
      child: Row(
        children: [
          Text(
            "$text",
            style: TextStyles.white516,
          ),
          Spacer(),
          Container(
            width: 70,
            height: 27,
            decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: TextField(
                cursorHeight: 8,
                onChanged: onChanged,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "SEARCH",
                    hintStyle: TextStyles.black514),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AddWidget extends StatelessWidget {
  const AddWidget({this.text, super.key, this.image, this.onTap});
  final String? text;
  final String? image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * .88,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppTheme.lightPrimary2,
      ),
      child: Row(
        children: [
          Text(
            "$text",
            style: TextStyles.white516,
          ),
          Spacer(),
          InkWell(
            onTap: onTap,
            child: ImageWidget(
              image: image ?? AppImages.search,
              height: 24,
            ),
          )
        ],
      ),
    );
  }
}
