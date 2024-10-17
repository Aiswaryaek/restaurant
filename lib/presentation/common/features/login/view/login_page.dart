// ignore_for_file: prefer_const_constructors

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/presentation/common/features/login/controller/login_controller.dart';
import 'package:restaurant/presentation/common/features/login/view/layouts/login_layout.dart';
import 'package:restaurant/presentation/common/features/login/view/layouts/login_search_user_layout.dart';

import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginCtrl = Get.find<LogInController>();
  @override
  void initState() {
    super.initState();
  }

  SharedAxisTransitionType? transitionType =
      SharedAxisTransitionType.horizontal;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: whiteColor,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Lottie.asset('assets/gif.json'),
                    ),

                    ///Back arrow
                    Obx(
                      () => Visibility(
                        visible: (loginCtrl.isShowLoginLayout.value == true)
                            ? true
                            : false,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: AppScreenUtil().screenHeight(20),
                              left: AppScreenUtil().screenWidth(25)),
                          child: GestureDetector(
                            onTap: () {
                              loginCtrl.isShowLoginLayout.value = false;
                            },
                            child: SvgPicture.asset(
                              ImageCons.imgLoginBackArrow,
                              height: AppScreenUtil().screenHeight(13.5),
                              width: AppScreenUtil().screenWidth(20.24),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
              
                    child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Obx(() => (loginCtrl.isShowLoginLayout.value == false)
                      ? LoginSearchUserLayout()
                      : LoginLayout()),
                )),
                // child: Align(
                //     alignment: FractionalOffset.bottomCenter,
                //     child:Obx(() => (loginCtrl.isShowLoginLayout.value == false)? LoginSearchUserLayout():LoginLayout()),)
              ],
            )));
  }

  onSignIn() {
    context.go('/AdminHomePage');
  }
}
