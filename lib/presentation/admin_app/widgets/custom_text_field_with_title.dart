import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../user_app/widgets/default_textfield.dart';

class CustomTextFieldWithTitle extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final dynamic width;
  final double? textFieldSize;
  const CustomTextFieldWithTitle({super.key,required this.controller,required this.title,this.width, this.textFieldSize = 38});

  @override
  State<CustomTextFieldWithTitle> createState() => _CustomTextFieldWithTitleState();
}

class _CustomTextFieldWithTitleState extends State<CustomTextFieldWithTitle> {
  @override
  Widget build(BuildContext context) {
    return  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: bookedTextStyle,overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(8),
                          ),
                          Container(
                            width: widget.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: whiteColor,
                                boxShadow:const [
                                  BoxShadow(
                                    color: searchTextColor,
                                    offset: Offset(0, 0),
                                    blurRadius: 1.5,
                                  ),
                                ]),
                            child: SizedBox(
                                height: widget.textFieldSize,
                                child: TextFormField(
                                  controller: widget.controller,maxLines: 10,
                                  style: subTitleTextStyle,
                                  cursorColor: searchShiftColor,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    isDense: true,
                                    hintStyle: placeholderTextStyle,
                                    fillColor: blackColor,
                                    enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: whiteColor),
                                    ),
                                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: whiteColor),
                                    ),
                                    errorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: whiteColor),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: whiteColor),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      );
  }
}