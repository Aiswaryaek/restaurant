// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/presentation/common/features/no_internet/controller/no_internet_controller.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../styles/textstyles.dart';

class AppNetworkErrorScreen extends StatefulWidget {
  const AppNetworkErrorScreen({super.key});

  @override
  State<AppNetworkErrorScreen> createState() => _AppNetworkErrorScreenState();
}

class _AppNetworkErrorScreenState extends State<AppNetworkErrorScreen> {
  final noInternetCtrl = Get.find<NoInternetController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: whiteColor,
        body:Container(
          color: whiteColor,
          child: Center(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/gif_app_network_error.json',height: 123,width: 140),
                SizedBox(height: AppScreenUtil().screenHeight(30),),
                Text('No Internet Connection',style: cartItemPriceLabelStyle,),
                SizedBox(height: AppScreenUtil().screenHeight(15),),
                Text('Please Check your Internet Connection',style: appErrorSubTextStyle,),
                Text('and Try Again',style: appErrorSubTextStyle,),
                SizedBox(height: AppScreenUtil().screenHeight(20),),
                GestureDetector(
                  onTap: (){
                    noInternetCtrl.checkNetwork();
                  },
                  child: Container(
                      padding: EdgeInsets.only(bottom: 3),
                      height: AppScreenUtil().screenHeight(32),
                      width: AppScreenUtil().screenWidth(111),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(11),color: confirmColor),
                      child: Center(
                        child: Text('Retry',style: appErrorButtonTextStyle,),
                      )
                  ),
                )
              ],
            ),
          ),
        )
    ));
  }
}
