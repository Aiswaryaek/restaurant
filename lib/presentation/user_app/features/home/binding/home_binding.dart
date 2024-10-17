



import 'package:get/get.dart';
import 'package:restaurant/presentation/user_app/features/home/controller/home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => HomeController());
  }
}