import 'package:analytica_task/views/home/main/view/main_home_view.dart';
import 'package:analytica_task/views/login/view/login_view.dart';
import 'package:analytica_task/views/signup/view/signup_view.dart';
import 'package:get/get.dart';
import '../views/splash/view/splash_view.dart';

class AppRoutes {
  static String splash = "/";
  static String login = "/login";
  static String signup = "/signup";
  static String forgot = "/forgot";
  static String mainHome = "/mainHome";
  

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashView()),
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: signup, page: () => const SignupView()),
    GetPage(name: mainHome, page: () => const MainHomeView()),
  ];
}
