import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/common/features/login/controller/login_controller.dart';
import 'package:restaurant/presentation/user_app/widgets/custom_text_button.dart';
import 'package:restaurant/presentation/user_app/widgets/custom_text_form_field.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class LoginSearchUserLayout extends StatefulWidget {
  const LoginSearchUserLayout({super.key});

  @override
  State<LoginSearchUserLayout> createState() => _LoginSearchUserLayoutState();
}

class _LoginSearchUserLayoutState extends State<LoginSearchUserLayout> {
  bool isValidUserId = true;

  bool isValidCompanyCode = true;
  final loginCtrl = Get.find<LogInController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
          decoration: const BoxDecoration(
              color: redColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: headTextStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(6),
                ),
                Text(
                  'Restaurant Innovative ERP Solutions',
                  style: loginSubTextStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(40),
                ),
                // buildTextFormField(setState, 'User ID', 'Enter Your UserID',
                //     userIdErrorMessage, false, userIdController),
                CustomTextField(
                  labelText: 'Company code',
                  hintText: 'Enter Your company code',
                  controller: loginCtrl.companyCodeController,
                  errorMessage: 'Enter a valid company code',
                  textInputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_.]')),
                  ],
                  isValidData: isValidCompanyCode,
                  labelTextStyle: labelTextStyle,
                  hintTextStyle: loginHintTextStyle,
                  errorTextColor: whiteColor,
                  errorMsgTextStyle: loginReusableTextStyle,
                  textInputTextStyle: loginInputTextStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(20),
                ),
                CustomTextField(
                  labelText: 'User ID',
                  hintText: 'Enter Your User ID',
                  controller: loginCtrl.userNameController,
                  errorMessage: 'Enter a valid User ID',
                  textInputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9!@#$%^&*]')),
                  ],
                  isValidData: isValidUserId,
                  labelTextStyle: labelTextStyle,
                  hintTextStyle: loginHintTextStyle,
                  errorTextColor: whiteColor,
                  errorMsgTextStyle: loginReusableTextStyle,
                  textInputTextStyle: loginInputTextStyle,
                ),
                // buildTextFormField(setState, 'Password', 'Enter Your Password',
                //     userIdErrorMessage, false, loginCtrl.passwordController),
                SizedBox(
                  height: AppScreenUtil().screenHeight(20),
                ),
                Obx(
                  () => (loginCtrl.isSearchUserLoading.value == true)
                      ? const Center(
                          child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ))
                      : CustomTextButton(
                        // padding: 1.0,
                          height: 32,
                          btnText: 'NEXT',
                          onTap: () {
                            validateFields();
                            if (isValidCompanyCode && isValidUserId) {
                              loginCtrl
                                  .searchUser(
                                      prefix: "RST",
                                      userName: loginCtrl.userNameController.text,
                                      companyCode:
                                          loginCtrl.companyCodeController.text)
                                  .then((value) {
                                if (value == true) {
                                  loginCtrl.isShowLoginLayout.value = true;
                                }
                              });
                            }
                          },
                          btnTextStyle: pangramMedium(size: 14.5, color: blackColor),
                        ),
                ),
            
                // defaultButton(context, 'SIGN IN', onSignIn),
                SizedBox(
                  height: AppScreenUtil().screenHeight(20),
                ),
                Text(
                  'Register here !',
                  style: loginRegisterHereTextStyle,
                ),
                // const Spacer(),
                // SizedBox(height: AppScreenUtil().screenHeight(90),),
          
              ],
            ),
          ),
        ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:  EdgeInsets.only(bottom: AppScreenUtil().screenHeight(28)),
                  child: Image.asset(
                    ImageCons.imgEyetLogoWhitePng,
                    width: AppScreenUtil().screenWidth(97),
                    height: AppScreenUtil().screenWidth(29),
                  ),
                ))
      ],
    );
  }

  ///Text field validation
  validateFields() {
    isValidUserId = AppUtils.validateUserId(loginCtrl.userNameController.text);
    isValidCompanyCode =
        AppUtils.validateCompanyCode(loginCtrl.companyCodeController.text);

    setState(() {});
  }
}
