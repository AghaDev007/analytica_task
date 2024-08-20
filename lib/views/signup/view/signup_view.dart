import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/gaps.dart';
import 'package:analytica_task/utils/text_styles.dart';
import 'package:analytica_task/utils/widgets/back_button_widget.dart';
import 'package:analytica_task/utils/widgets/button_widget.dart';
import 'package:analytica_task/utils/widgets/richtext_button_widget.dart';
import 'package:analytica_task/utils/widgets/text_field_widget.dart';

import '../controller/signup_controller.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
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
                  key: controller.formKey,
                  child: Column(
                    children: [
                      verticalGap(context.height * .06),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: BackButtonWidget(
                            onPressFunction: () {
                              Get.back();
                            },
                          ),
                        ),
                      ),
                      const Text(
                        "Register",
                        style: TextStyles.black624,
                      ),
                      verticalGap(context.height * .003),
                      const Text(
                        "Just a few things to get started",
                        style: TextStyles.black414,
                      ),
                      verticalGap(context.height * .03),
                      TextFieldWidget(
                        title: "",
                        hintText: "First Name",
                        controller: controller.fullName,
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return 'Please enter your First Name';
                            }
                          }

                          return null;
                        },
                      ),
                      verticalGap(context.height * .01),
                      TextFieldWidget(
                        title: "",
                        hintText: "Last Name",
                        controller: controller.lastname,
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return 'Please enter your First Name';
                            }
                          }

                          return null;
                        },
                      ),
                      verticalGap(context.height * .01),
                      TextFieldWidget(
                        title: "",
                        hintText: "Email",
                        controller: controller.emails,
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
                      verticalGap(context.height * .01),
                      TextFieldWidget(
                        title: "",
                        hintText: "Phone Number",
                        controller: controller.phones,
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return 'Please enter your Number';
                            }
                          }
                          return null;
                        },
                      ),
                      verticalGap(context.height * .01),
                      Obx(
                        () => TextFieldWidget(
                          sufIcon: true,
                          obscureText: controller.obscureText.value,
                          iconPath: controller.obscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          iconPressed: () {
                            controller.obscureText.value =
                                !controller.obscureText.value;
                          },
                          iconColor: controller.obscureText.value
                              ? AppTheme.grey
                              : AppTheme.primary,
                          title: "",
                          hintText: "Create Password",
                          controller: controller.passwords,
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
                      verticalGap(context.height * .04),
                      ButtonWidget(
                        onPressFunction: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.signup(
                                controller.emails.text.trim(),
                                controller.passwords.text.trim(),
                                controller.fullName.text.trim() +
                                    " " +
                                    controller.lastname.text.trim(),
                                controller.phones.text.trim());
                          }
                        },
                        stringText: "Create Account",
                      ),
                      verticalGap(context.height * .1),
                      RichtextButtonWidget(
                        text1: "Do you have an account? ",
                        text2: "LOG IN",
                        onPressFunction: () {
                          Get.back();
                        },
                      ),
                      verticalGap(context.height * .01),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
