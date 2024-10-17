// ignore_for_file: avoid_types_as_parameter_names, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/textstyles.dart';
import '../../../utiles/app_screen_util.dart';
import 'custom_button.dart';

void customAddNote(BuildContext context,
    {required String title,required TextEditingController noteController,required bool isNoteAdded
   }) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
          builder: (context, setState) {return Dialog(alignment:Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9), // Set border radius here
            ),
            child:  GestureDetector(
              onTap: () {
                setState(() {
                  isNoteAdded = true;
                });
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 15),
                // height: AppScreenUtil().screenHeight(101),
                // width: AppScreenUtil().screenWidth(226),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(9)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: AppScreenUtil().screenHeight(29),
                    ),
                    Text(
                      'Add Note',
                      style: holdOrderStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: confirmColor),
                        color: whiteColor,
                      ),
                      child: SizedBox(
                          height: 101,
                          child: TextField(
                            controller: noteController,showCursor: true,
                            maxLines: 10,
                            style: searchInputTextStyle,
                            cursorColor: blackColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              isDense: true,
                              hintStyle: placeholderTextStyle,
                              fillColor: blackColor,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(10),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: CustomButton(
                            buttonHeight: AppScreenUtil().screenHeight(21),
                            buttonWidth: AppScreenUtil().screenWidth(77),
                            buttonColor: confirmColor,
                            borderRadius: 7,
                            buttonText: 'Add',
                            buttonLabelStyle:
                            backupAndRestoreSubmitButtonLabelStyle))
                  ],
                )
              ),
            ),
          );});
    },
  );
}
