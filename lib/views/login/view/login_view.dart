import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:analytica_task/utils/app_routes.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/gaps.dart';
import 'package:analytica_task/utils/text_styles.dart';
import 'package:analytica_task/utils/widgets/button_widget.dart';
import 'package:analytica_task/utils/widgets/richtext_button_widget.dart';
import 'package:analytica_task/utils/widgets/text_field_widget.dart';
import '../../../utils/app_images.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Obx(() => ModalProgressHUD(
          inAsyncCall: controller.load.value,
          child: Scaffold(
            body: Container(
              width: context.width,
              height: context.height,
              decoration: const BoxDecoration(
                color: AppTheme.white,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      verticalGap(context.height * .1),
                      Image.asset(
                        AppImages.logo,
                        height: context.height * 0.3,
                        width: context.width * 0.7,
                        fit: BoxFit.fill,
                      ),
                      const Text(
                        "Welcome Back",
                        style: TextStyles.black624,
                      ),
                      verticalGap(context.height * .02),
                      TextFieldWidget(
                        title: "",
                        hintText: "Email or Phone",
                        controller: controller.username,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      Obx(
                        () => TextFieldWidget(
                          sufIcon: true,
                          obscureText: controller.obscureText.value,
                          iconPath: controller.obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          controller: controller.password,
                          iconPressed: () {
                            controller.obscureText.value =
                                !controller.obscureText.value;
                          },
                          iconColor: controller.obscureText.value
                              ? AppTheme.grey
                              : AppTheme.primary,
                          title: "",
                          hintText: "Password",
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: context.width * .88,
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                         
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyles.black514,
                          ),
                        ),
                      ),
                      verticalGap(context.height * .07),
                      ButtonWidget(
                        onPressFunction: () {
                          if (formKey.currentState!.validate()) {
                            controller.signIn(controller.username.text,
                                controller.password.text);
                          }
                        },
                        stringText: "LOG IN",
                      ),
                      verticalGap(context.height * .01),
                      RichtextButtonWidget(
                        text1: "Don’t have an account? ",
                        text2: "Sign Up",
                        onPressFunction: () {
                          Get.toNamed(AppRoutes.signup);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
