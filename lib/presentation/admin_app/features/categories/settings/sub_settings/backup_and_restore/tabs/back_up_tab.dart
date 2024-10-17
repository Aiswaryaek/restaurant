import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_textfield.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../user_app/widgets/custom_button.dart';


class BackupTab extends StatefulWidget {
  const BackupTab({super.key});

  @override
  State<BackupTab> createState() => _BackupTabState();
}

class _BackupTabState extends State<BackupTab> {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ColoredTextField(
                    color: textFieldColor,
                    controller: TextEditingController(),
                    title: 'Backup Path',sufixIcon: Padding(
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