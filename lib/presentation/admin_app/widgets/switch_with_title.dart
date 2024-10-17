import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class SwitchWithTitle extends StatefulWidget {
  final String title;
  final bool value;
  final void Function(bool) onToggle;
  const SwitchWithTitle({super.key,required this.onToggle,required this.title,required this.value});

  @override
  State<SwitchWithTitle> createState() => _SwitchWithTitleState();
}

class _SwitchWithTitleState extends State<SwitchWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Text(
                        widget.title,
                        style: bookedTextStyle,
                      ),
                      SizedBox(height: AppScreenUtil().screenHeight(15),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlutterSwitch(
                            width: 43,
                            height: 18,
                            toggleSize: 11.0,
                            value: widget.value ,
                            borderRadius: 30.0,
                            padding: 2.0,
                            toggleColor: widget.value == false?confirmColor:greenColor,
                            switchBorder: Border.all(
                              color: widget.value == false?confirmColor:greenColor,
                              width: 1,
                            ),
                            toggleBorder: Border.all(
                              color: widget.value == false?confirmColor:greenColor,
                              width: 1,
                            ),
                            activeColor: whiteColor,
                            inactiveColor: whiteColor,
                            onToggle: widget.onToggle,
                          )
                        ],
                      )
    ],);
  }
}