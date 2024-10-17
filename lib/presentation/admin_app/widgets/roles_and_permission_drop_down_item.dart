import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class RolesAndPermissionDropDownItem extends StatefulWidget {
  final bool value;
  final Color toggleColor;
  final Color toggleBorderColor;
  final Color switchBorderColor;
  final Color activeColor;
  final Color inActiveColor;
  final String itemName;
final Function(bool) onToggle;
  const RolesAndPermissionDropDownItem({super.key,required this.activeColor,required this.onToggle,required this.inActiveColor,required this.switchBorderColor,required this.itemName,required this.toggleBorderColor,required this.toggleColor,required this.value});

  @override
  State<RolesAndPermissionDropDownItem> createState() => _RolesAndPermissionDropDownItemState();
}

class _RolesAndPermissionDropDownItemState extends State<RolesAndPermissionDropDownItem> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(bottom: AppScreenUtil().screenHeight(8)),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(widget.itemName,style:bookedTextStyle ,),
                 FlutterSwitch(
                        width: 36,
                        height: 16,
                        toggleSize: 11.0,
                        value: widget.value,
                        borderRadius: 30.0,
                        padding: 2.0,
                        toggleColor: widget.toggleColor,
                        switchBorder: Border.all(
                          color: widget.switchBorderColor,
                          width: 1,
                        ),
                        toggleBorder: Border.all(
                          color: widget.toggleBorderColor,
                          width: 1,
                        ),
                        activeColor: widget.activeColor,
                        inactiveColor: widget.inActiveColor,
                        onToggle: widget.onToggle
                      ),
                
      
               ],),
    );
  }
}