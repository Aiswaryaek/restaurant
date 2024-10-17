



import 'package:get/get.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/controller/table_controller.dart';

class TableBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => TableController());
  }
}