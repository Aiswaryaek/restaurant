import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant/core/constants/colors.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_image_view.dart';
import 'package:restaurant/presentation/common/features/login/controller/login_controller.dart';
import 'package:restaurant/presentation/user_app/widgets/custom_text_button.dart';
import 'package:restaurant/presentation/user_app/widgets/custom_text_form_field.dart';
import 'package:restaurant/routes/index.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  bool isValidUserId = true;
  bool isValidPassword = true;

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
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                      ],
                    ),
            
                    ///Image layout
                    Column(
                      children: [
                        SizedBox(
                          width: AppScreenUtil().screenWidth(70),
                          child: Text(
                            loginCtrl.searchUserResData.companyName ?? 'N/A',
                            style: loginRegisterHereTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        CommonImageView(
                          placeHolder: ImageCons.imgLoginPlaceHolder,
                          height: AppScreenUtil().screenWidth(40),
                          width: AppScreenUtil().screenWidth(53),
                          url: loginCtrl.searchUserResData.logo.toString(),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(25),
                ),
                // buildTextFormField(setState, 'User ID', 'Enter Your UserID',
                //     userIdErrorMessage, false, userIdController),
                CustomTextField(
                  readOnly: true,
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
                  readOnly: true,
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(10)),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Role: ${loginCtrl.searchUserResData.role ?? 'N/A'}',
                      style: loginRegisterHereTextStyle,
                    ),
                  ),
                ),
                CustomTextField(
                  readOnly: false,
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  controller: loginCtrl.passwordController,
                  errorMessage: 'Enter a valid Password',
                  textInputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9!@#$%^&*]')),
                  ],
                  isValidData: isValidPassword,
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
                  () => (loginCtrl.isLoading.value == true)
                      ? const Center(
                          child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ))
                      : CustomTextButton(
                          height: 32,
                          btnText: 'NEXT',
                          onTap: () {
                            validateFields();
            
                            ///The Api response of login are different from user and admin so that reason we set different api calls to get this different datas
            
                            if (isValidCompanyCode &&
                                isValidUserId &&
                                isValidPassword) {
                              if (loginCtrl.searchUserResData.role == 'user') {
                                loginCtrl
                                    .userLogIn(
                                  userName: loginCtrl.userNameController.text,
                                  passWord: loginCtrl.passwordController.text,
                                  companyCode: loginCtrl.companyCodeController.text,
                                  prefix: "RST",
                                )
                                    .then((value) {
                                  if (value == true) {
                                    if (AppUtils.getRole() == 'user') {
                                      ///User home page
                                      Get.offNamed(routeName.homePage);
                                    } else {
                                      ///Admin home page
                                      Get.offNamed(routeName.adminHomePage);
                                    }
                                  }
                                });
                              } else if (loginCtrl.searchUserResData.role ==
                                  'admin') {
                                loginCtrl
                                    .adminLogIn(
                                  userName: loginCtrl.userNameController.text,
                                  passWord: loginCtrl.passwordController.text,
                                  companyCode: loginCtrl.companyCodeController.text,
                                  prefix: "RST",
                                )
                                    .then((value) {
                                  if (value == true) {
                                    if (AppUtils.getRole() == 'user') {
                                      ///User home page
                                      Get.offNamed(routeName.homePage);
                                    } else {
                                      ///Admin home page
                                      Get.offNamed(routeName.adminHomePage);
                                    }
                                  }
                                });
                              } else { 
                                AppUtils.oneTimeSnackBar(
                                    'Could not complete the request',
                                    bgColor: ColorConst.red);
                              }
                            }
                          },
                          btnTextStyle: btnTextStyle,
                        ),
                ),
            
                // defaultButton(context, 'SIGN IN', onSignIn),
                SizedBox(
                  height: AppScreenUtil().screenHeight(10),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Register here !',
                      style: loginRegisterHereTextStyle,
                    ),
                    Text(
                      'Forgot Password',
                      style: loginRegisterHereTextStyle,
                    ),
                  ],
                ),
            
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
    isValidPassword =
        AppUtils.validationOfPassword(loginCtrl.passwordController.text);

    setState(() {});
  }
}
