

import 'package:get/get.dart';
import 'package:restaurant/presentation/common/features/splash_screen/controller/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}