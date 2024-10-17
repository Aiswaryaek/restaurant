import 'package:flutter/material.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../user_app/widgets/custom_button.dart';
import '../../../../../widgets/colored_textfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 8, 25, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredTextField(
              color: textFieldColor,
              controller: currentPasswordController,
              title: 'Current Password'),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          ColoredTextField(
              color: textFieldColor,
              controller: newPasswordController,
              title: 'New Password'),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          ColoredTextField(
              color: textFieldColor,
              controller: confirmNewPasswordController,
              title: 'Confirm New Password'),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
         Align(
           alignment: Alignment.centerRight,
           child:  CustomButton(
             buttonHeight:
             AppScreenUtil().screenHeight(24),
             buttonWidth:
             AppScreenUtil().screenWidth(104),
             buttonColor: blackColor,
             borderRadius: 12,
             buttonText: 'Update',
             buttonLabelStyle:
             inventoryCreateButtonLabelStyle),)
        ],
      ),
    );;
  }
}
