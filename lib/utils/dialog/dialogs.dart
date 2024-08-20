import 'package:analytica_task/services/auth_services.dart';
import 'package:analytica_task/utils/app_icons.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/gaps.dart';
import 'package:analytica_task/utils/text_styles.dart';
import 'package:analytica_task/utils/widgets/button_widget.dart';
import 'package:analytica_task/utils/widgets/image/svg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: context.width,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: AppTheme.primary,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgImageWidget(
                    image: AppIcons.sad,
                  ),
                  verticalGap(10),
                  Text(
                    "Logout",
                    style: TextStyles.white614,
                  ),
                  verticalGap(5),
                  SizedBox(
                    width: context.width * 0.7,
                    child: const Text(
                      "Do you want to logout your session?",
                      style: TextStyles.white314,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalGap(5),
                ],
              ),
            ),
            verticalGap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  stringText: "No",
                  height: 50,
                  color: AppTheme.grey,
                  width: context.width * 0.35,
                  onPressFunction: () {
                    Get.close(1);
                  },
                ),
                horizontalGap(10),
                ButtonWidget(
                  stringText: "Yes",
                  height: 50,
                  color: AppTheme.red,
                  width: context.width * 0.35,
                  onPressFunction: () {
                    AuthService().signOut();
                    Get.close(1);
                  },
                )
              ],
            ),
            verticalGap(15),
          ],
        ),
      ),
    );
  }
}
