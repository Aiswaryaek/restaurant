// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../styles/textstyles.dart';

class AppErrorScreen extends StatefulWidget {
  final Function()? buttonOnTap;
  const AppErrorScreen({super.key,this.buttonOnTap});

  @override
  State<AppErrorScreen> createState() => _AppErrorScreenState();
}

class _AppErrorScreenState extends State<AppErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: whiteColor,
        child: Center(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/gif_app_error.json',height: 142,width: 190),
              SizedBox(height: AppScreenUtil().screenHeight(30),),
              Text('Something Went Wrong!',style: cartItemPriceLabelStyle,),
              SizedBox(height: AppScreenUtil().screenHeight(15),),
              Text('Refresh App to fix this',style: appErrorSubTextStyle,),
              SizedBox(height: AppScreenUtil().screenHeight(20),),
              GestureDetector(
                onTap:widget.buttonOnTap ,
                child: Container(
                  padding: EdgeInsets.only(bottom: 3),
                  height: AppScreenUtil().screenHeight(32),
                  width: AppScreenUtil().screenWidth(111),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(11),color: confirmColor),
                  child: Center(
                    child: Text('Refresh',style: appErrorButtonTextStyle,),
                  )
                ),
              )
            ],
          ),
        ),
      );
  }
}
