import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analytica_task/utils/app_theme.dart';

class BackButtonWidget extends StatelessWidget {
  final Function()? onPressFunction;
  final double? width, height;

  const BackButtonWidget(
      {super.key, this.onPressFunction, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressFunction,
      child: Container(
        width: width ?? 45,
        height: height ?? 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: AppTheme.black26,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 10,
          ),
        ),
      ),
    );
  }
}
