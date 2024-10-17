import 'package:get/get.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/common/features/splash_screen/view/splash_screen.dart';

class NoInternetController extends GetxController{
      //if network error then go to network error screen else goto splash screen
  checkNetwork() async {
    if(await AppUtils.isOnline()){
      Get.offAllNamed('/');
    }else{
      AppUtils.oneTimeSnackBar('No internet connection!',);
    }
  }
}