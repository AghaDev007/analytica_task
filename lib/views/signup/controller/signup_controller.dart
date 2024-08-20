import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:analytica_task/services/auth_services.dart';
import 'package:analytica_task/utils/app_routes.dart';

class SignupController extends GetxController {
  final auth = FirebaseAuth.instance;

  var obscureText = true.obs;
  var obscureText1 = true.obs;

  TextEditingController fullName = TextEditingController();
  TextEditingController passwords = TextEditingController();
  TextEditingController emails = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phones = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var load = false.obs;

  void onLoad(value) {
    if (value != null) {
      load.value = value;
    }
  }

  Future signup(
      String email, String password, String username, String phone) async {
    load(true);

    final res = await AuthService().signup(
      email,
      password,
      username,
      phone,
    );
    if (res == 200) {
      load(false);
      fullName.clear();
      emails.clear();
      phones.clear();
      passwords.clear();
      lastname.clear();
      Get.offNamed(AppRoutes.mainHome);
      Get.snackbar("Success", "Account Registered!");
    } else {
      load(false);
      await auth.signOut();
    }
  }
}
