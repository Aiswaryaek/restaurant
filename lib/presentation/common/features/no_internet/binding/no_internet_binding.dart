import 'package:get/get.dart';
import 'package:restaurant/presentation/common/features/no_internet/controller/no_internet_controller.dart';

class NoInternetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoInternetController());
  }
}
