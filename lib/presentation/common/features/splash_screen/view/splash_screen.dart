import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurant/presentation/common/features/login/controller/login_controller.dart';
import 'package:restaurant/presentation/common/features/splash_screen/controller/splash_controller.dart';
import 'package:restaurant/utiles/image_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashCtrl = Get.find<SplashController>();
  final loginCtrl = Get.find<LogInController>();

  @override
  void initState() {
    loginCtrl.isShowLoginLayout.value = false;

    splashCtrl.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SvgPicture.asset(
          ImageCons.imgSplash,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
