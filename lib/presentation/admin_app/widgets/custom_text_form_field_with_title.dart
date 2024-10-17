import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../user_app/widgets/default_text_form_field.dart';

class CustomTextFormFieldWithTitle extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final dynamic width;
  final bool isTitleBold;
  const CustomTextFormFieldWithTitle({super.key,required this.controller,required this.title,this.width,this.isTitleBold = false});

  @override
  State<CustomTextFormFieldWithTitle> createState() => _CustomTextFormFieldWithTitleState();
}

class _CustomTextFormFieldWithTitleState extends State<CustomTextFormFieldWithTitle> {
  @override
  Widget build(BuildContext context) {
    return  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style:(widget.isTitleBold == false)? bookedTextStyle:rolesAndPermissionModuleAccessTabLabelStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(8),
                          ),
                          Container(
                            height: 43,
                            width: widget.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: textFieldColor,
                              ),
                            child: SizedBox(
                                height: 43,
                                child: DefaultTextFormField(setState: setState, controller: TextEditingController(),sufix: Padding(
                                  padding:  EdgeInsets.only(right: AppScreenUtil().screenWidth(21.50),top: AppScreenUtil().screenHeight(10),bottom: AppScreenUtil().screenHeight(10)),
                                  child: SvgPicture.asset(ImageCons.imgSearchIcon,height: 12.22,width: 12.22,),
                                ),),),
                          )
                        ],
                      );
  }
}