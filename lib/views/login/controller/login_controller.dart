import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analytica_task/services/auth_services.dart';
import 'package:analytica_task/utils/app_routes.dart';

class LoginController extends GetxController {
  final auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  var obscureText = true.obs;
  var load = false.obs;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void onLoad(value) {
    if (value != null) {
      load.value = value;
    }
  }

  Future signIn(String email, String passwords) async {
    load(true);
    final res = await AuthService().signin(email, passwords);
    if (res == 200) {
      load(false);
      Get.offNamed(AppRoutes.mainHome);
      username.clear();
      password.clear();
    } else {
      load(false);
      await auth.signOut();
      // Get.snackbar("Error", "Invalid Credentials");
    }
  }
}
