import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressFunction;
  final String? stringText;
  final double? width, height;
  final TextStyle? textStyle;
  final Color? color;

  const ButtonWidget({
    super.key,
    this.onPressFunction,
    this.stringText,
    this.width,
    this.height,
    this.textStyle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressFunction,
      child: Container(
        width: width ?? context.width * .88,
        height: height ?? 60,
        decoration: BoxDecoration(
            color: color ?? AppTheme.primary2,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 4),
                color: AppTheme.black26,
              ),
            ],
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(stringText.toString(),
              style: textStyle ?? TextStyles.secondary716),
        ),
      ),
    );
  }
}
