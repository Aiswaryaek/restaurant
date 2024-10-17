import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/company_settings/controller/controller.dart';

class CompanySettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanySettingsController());
  }
}
