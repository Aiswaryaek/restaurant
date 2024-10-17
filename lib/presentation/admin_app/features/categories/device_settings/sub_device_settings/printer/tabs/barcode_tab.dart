import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_textfield.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../user_app/widgets/custom_button.dart';


class BarcodeTab extends StatefulWidget {
  const BarcodeTab({super.key});

  @override
  State<BarcodeTab> createState() => _BarcodeTabState();
}

class _BarcodeTabState extends State<BarcodeTab> {
  int? selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: AppScreenUtil().screenHeight(20),),
        ///Radio buttons
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Transform.translate(
                              offset: Offset(-4.5, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<int>(
                                    activeColor: blackColor,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                    value: 0,
                                    groupValue: selectedOption,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedOption = value;
                                      });
                                      print(
                                          'Selected Option : $selectedOption');
                                    },
                                  ),
                                  Text(
                                    'Automatic',
                                    style: xlTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: AppScreenUtil().screenWidth(65)),
         
                          Container(
                            color: Colors.transparent,
                            child: Transform.translate(
                              offset: Offset(-4.5, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<int>(
                                    activeColor: blackColor,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                    value: 1,
                                    groupValue: selectedOption,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedOption = value;
                                      });
                                      print(
                                          'Selected Option : $selectedOption');
                                    },
                                  ),
                                  Text(
                                    'Manual',
                                    style: xlTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppScreenUtil().screenHeight(11),),
        ColoredTextField(
          titleVisibility: false,
                    color: textFieldColor,
                    controller: TextEditingController(),
                    hint:'HP Laser jet 400 M401' ,
                    readOnly: true,
                    title: '',),
                    SizedBox(height: AppScreenUtil().screenHeight(10),),
                    Align(
                      alignment: Alignment.topRight,
                      child: CustomButton(buttonHeight:AppScreenUtil().screenHeight(24),buttonWidth: AppScreenUtil().screenWidth(83)  , buttonColor: blackColor , borderRadius: 10.0, buttonText: 'Submit', buttonLabelStyle: backupAndRestoreSubmitButtonLabelStyle))

      ],
    );
  }
}