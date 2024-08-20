import 'package:analytica_task/views/cart/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:analytica_task/views/home/home/controller/home_controller.dart';
import 'package:analytica_task/views/home/main/controller/main_home_controller.dart';
import 'package:analytica_task/views/login/controller/login_controller.dart';
import 'package:analytica_task/views/signup/controller/signup_controller.dart';
import '../views/splash/controller/splash_controller.dart';

class InitializingDependency implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignupController(), fenix: true);
    Get.lazyPut(() => MainHomeController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
