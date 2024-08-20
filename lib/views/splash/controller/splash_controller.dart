import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:analytica_task/utils/app_routes.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onReady() {
    checkUserStatus();
    super.onReady();
  }

  void checkUserStatus() async {
    await Future.delayed(Duration(seconds: 1));

    final user = auth.currentUser;
    if (user != null) {
      Get.offNamed(AppRoutes.mainHome);
    } else {
      Get.offNamed(AppRoutes.login);
    }
  }
}
