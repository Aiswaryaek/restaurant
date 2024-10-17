import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_textfield.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../user_app/widgets/custom_button.dart';


class RestoreTab extends StatefulWidget {
  const RestoreTab({super.key});

  @override
  State<RestoreTab> createState() => _RestoreTabState();
}

class _RestoreTabState extends State<RestoreTab> {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ColoredTextField(
          readOnly: true,
                    color: textFieldColor,
                    controller: TextEditingController(),
                    title: 'Restore Path',sufixIcon: Padding(
                      padding:  EdgeInsets.only(right: AppScreenUtil().screenWidth(5)),
                      child: SvgPicture.asset(ImageCons.imgUpload,height: 20,width: 33,),
                    ),),
                    SizedBox(height: AppScreenUtil().screenHeight(10),),
                    Align(
                      alignment: Alignment.topRight,
                      child: CustomButton(buttonHeight:AppScreenUtil().screenHeight(24),buttonWidth: AppScreenUtil().screenWidth(83)  , buttonColor: blackColor , borderRadius: 10.0, buttonText: 'Submit', buttonLabelStyle: backupAndRestoreSubmitButtonLabelStyle))

      ],
    );
  }
}