

import 'package:get/get.dart';
import 'package:restaurant/presentation/common/features/login/controller/login_controller.dart';


class LogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInController());
  }
}