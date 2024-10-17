import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant/core/config/scale.dart';
import 'package:restaurant/core/config/session.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/routes/index.dart';

class SplashController extends GetxController {
  ///These splashTimer used only for testing purpose
  // splashTimer (){
  //    Future.delayed(const Duration(seconds: 2), () {
  //     Get.toNamed(routeName.onBoardScreen);
  //   });
  // }
  bool isTapped = false;

  final storage = GetStorage();
  @override
  void onInit() async {
    
    isTapped = false;
    update();
    await Future.delayed(Durations.s3);
    isTapped = true;
    update();
    await Future.delayed(Durations.s1);

    ///Redirect to no internet screen if internet is not available
    if (await AppUtils.isOnline()) {
      checkLogin();
    } else {
      Get.toNamed('/AppNetworkErrorScreen');
    }
    super.onInit();
  }

  ///Check login
  void checkLogin() async {
    //#region set Language
    String? languageCode = storage.read(Session.languageCode);
    String? countryCode = storage.read(Session.countryCode);
    bool? isLogin = storage.read(Session.isLogin);
    if (languageCode != null && countryCode != null) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
    } else {
      Get.updateLocale(Get.deviceLocale ?? const Locale('en', 'US'));
    }

    if (AppUtils.getAccessToken().isEmpty) {
      // Checking if user is already login or not
      Get.toNamed(routeName.loginPage);

      // if (!AppUtils.onBoardInIt()) {
      //   Get.toNamed(routeName.onBoardScreen);
      // } else {
      //   Get.toNamed(routeName.signInScreen);
      // }
    } else {
      if (AppUtils.getRole() == 'user') {
        ///User home page
        Get.offNamed(routeName.homePage);
      } else {
        ///Admin home page
        Get.offNamed(routeName.adminHomePage);
      }
      // Get.offNamed(routeName.bottomNavBar);
    }
  }
}
