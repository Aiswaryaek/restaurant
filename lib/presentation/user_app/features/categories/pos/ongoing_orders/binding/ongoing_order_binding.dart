import 'package:get/get.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/controller/ongoing_orders_controller.dart';

class OngoingOrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OngoingOrdersController());
  }
}
