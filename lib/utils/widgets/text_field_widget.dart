import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/gaps.dart';
import 'package:analytica_task/utils/text_styles.dart';
import 'image/svg_image_widget.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {this.hintText,
      this.obscureText,
      this.readOnly,
      this.controller,
      this.iconPath,
      this.iconPressed,
      this.keyboardType,
      this.height,
      this.width,
      this.sufIcon = false,
      this.onTap,
      this.title,
      this.iconColor,
      super.key,
      this.validator,
      this.maxLines});

  final String? hintText, title;
  final IconData? iconPath;
  final bool? obscureText;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final double? height, width;
  final bool sufIcon;
  final Color? iconColor;
  final String? Function(String?)? validator;
  final Function()? iconPressed, onTap;
  final TextEditingController? controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .88,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   title.toString(),
          //   style: TextStyles.lightprimary2513,
          // ),
          // verticalGap(context.height * .004),
          SizedBox(
            width: context.width * .88,
            height: height ?? 60,
            child: TextFormField(
              onTap: onTap,
              maxLines: maxLines ?? 1,
              validator: validator,
              keyboardType: keyboardType ?? TextInputType.text,
              readOnly: readOnly ?? false,
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              obscureText: obscureText ?? false,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppTheme.white,
                hintText: hintText,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 19,
                ),
                hintStyle: TextStyles.grey414,
                suffixIcon: sufIcon == true
                    ? InkWell(
                        onTap: iconPressed,
                        child: Icon(
                          iconPath,
                          size: 19,
                          color: iconColor,
                        ),
                      )
                    : SizedBox(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppTheme.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppTheme.grey)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
