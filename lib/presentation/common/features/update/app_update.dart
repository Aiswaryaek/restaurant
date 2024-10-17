// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../styles/textstyles.dart';

class AppUpdateScreen extends StatefulWidget {
  const AppUpdateScreen({super.key});

  @override
  State<AppUpdateScreen> createState() => _AppUpdateScreenState();
}

class _AppUpdateScreenState extends State<AppUpdateScreen> {
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
                Lottie.asset('assets/gif_app_update.json',height: 123,width: 140),
                SizedBox(height: AppScreenUtil().screenHeight(30),),
                Text('Time to Update',style: cartItemPriceLabelStyle,),
                SizedBox(height: AppScreenUtil().screenHeight(15),),
                Text('We have added lots of new features',style: appErrorSubTextStyle,),
                Text('to make your experience as smooth as possible',style: appErrorSubTextStyle,),
                SizedBox(height: AppScreenUtil().screenHeight(20),),
                Container(
                    padding: EdgeInsets.only(bottom: 3),
                    height: AppScreenUtil().screenHeight(32),
                    width: AppScreenUtil().screenWidth(111),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(11),color: confirmColor),
                    child: Center(
                      child: Text('Update',style: appErrorButtonTextStyle,),
                    )
                )
              ],
            ),
          ),
        )
    ));
  }
}
