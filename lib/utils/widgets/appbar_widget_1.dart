import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/text_styles.dart';
import 'package:analytica_task/utils/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppbarWidget1 extends StatelessWidget {
  const AppbarWidget1({this.backTap, this.title, super.key});

  final String? title;
  final Function()? backTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(left: 23, right: 23, top: 35),
      decoration: BoxDecoration(color: AppTheme.white, boxShadow: [
        BoxShadow(
            blurRadius: 20, offset: Offset(0, 4), color: AppTheme.black12),
      ]),
      child: Row(
      
        children: [
          BackButtonWidget(
            width: 35,
            height: 35,
            onPressFunction: backTap,
          ),
          Spacer(),
          Text(
            title ?? "",
            style: TextStyles.lightprimary618,
          ),
          Spacer(),
          SizedBox(
            width: 35,
            height: 35,
          )
        ],
      ),
    );
  }
}
