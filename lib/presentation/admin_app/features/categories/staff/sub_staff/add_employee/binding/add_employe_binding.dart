import 'package:get/get.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/add_employee/controller/add_employe_controller.dart';

class AddEmployeeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddEmployeeController());
  }
}
