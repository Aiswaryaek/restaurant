import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_textfield.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../user_app/widgets/custom_button.dart';

class ClearDataTab extends StatefulWidget {
  const ClearDataTab({super.key});

  @override
  State<ClearDataTab> createState() => _ClearDataTabState();
}

class _ClearDataTabState extends State<ClearDataTab> {
  String sampleAlertMsg =
      'Workorder, Commission, Measurement, Alteration, Payment, Credit, Wallet, Sales return, Delivered Product, Return payment, Purchase, Purchase WOPO, Payment Voucher, GRN, Stock Out, Stock Adjustment, Stock Transfer, Quotation, Order, Damaged Goods, Stock, Stock Log, Old Stock log, Log, Shift, Shift log, Shift Transfer Log, Shift End, Offer, Coupon, Expense, Petty cash, Customer, Relation.';
      ///The boolean is used only for testing purpose
bool isDeletedRequested = false;
bool isDeleteSubmit = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredTextField(
          color: textFieldColor,
          controller: TextEditingController(),
          title: 'Branch',
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () {
                  clearDataAlertDialogue(context,);
                },
                child: CustomButton(
                    buttonHeight: AppScreenUtil().screenHeight(24),
                    buttonWidth: AppScreenUtil().screenWidth(83),
                    buttonColor: blackColor,
                    borderRadius: 10.0,
                    buttonText: 'Clear Data',
                    buttonLabelStyle: backupAndRestoreSubmitButtonLabelStyle)))
      ],
    );
  }

  ///Clear Data alert dialogue
  void clearDataAlertDialogue(BuildContext context,) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding:
              EdgeInsets.symmetric(horizontal:(isDeleteSubmit == true)? AppScreenUtil().screenWidth(75):AppScreenUtil().screenWidth(25)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(7)),
            child:(isDeleteSubmit == true)?Padding(
              padding:  EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(35)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
              ///Delete tik mark
                            SvgPicture.asset(ImageCons.imgDeleteSuccess,height: AppScreenUtil().screenHeight(55),width:AppScreenUtil().screenHeight(55) ,),
SizedBox(height: AppScreenUtil().screenHeight(18),),
Text('Data Cleared',style: dataClearedLabelStyle,)
              // Lottie.asset(ImageCons.gifDeleteSuccess,height: AppScreenUtil().screenHeight(55),width:AppScreenUtil().screenHeight(55) ,)
              
                ],),
            ):(isDeletedRequested == false)?
              ///Delete alert dialogue layout column
               Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppScreenUtil().screenHeight(23),
                  horizontal: AppScreenUtil().screenWidth(25)),
              child:
               Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///Icon
                  SvgPicture.asset(
                    ImageCons.imgAlertIconMain,
                    height: AppScreenUtil().screenHeight(57),
                    width: AppScreenUtil().screenWidth(57),
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(13),
                  ),

                  ///Alert title text
                  Text(
                    'Are you sure you want to Clear below listed Data',
                    style: clearDataAlertTitleLabelStyle,
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(17),
                  ),

                  ///Msg container
                  Container(
                    width: double.infinity,
                    height: AppScreenUtil().screenHeight(65),
                    color: Colors.transparent,
                    child: Text(
                      sampleAlertMsg,
                      textAlign: TextAlign.center,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: clearDataAlertSubTitleLabelStyle,
                    ),
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(25),
                  ),

                  ///Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ///No button
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: CustomButton(
                          buttonHeight: AppScreenUtil().screenHeight(24),
                          buttonWidth: AppScreenUtil().screenWidth(83),
                          buttonColor: whiteColor,
                          borderRadius: 10.0,
                          buttonText: 'No',
                          buttonLabelStyle: clearDataAlertNoButtonLabelStyle,
                          border: Border.all(
                              color: clearDataAlertNoButtonBorderColor, width: 1),
                        ),
                      ),
                      SizedBox(
                        width: AppScreenUtil().screenWidth(10),
                      ),

                      ///Yes button
                      GestureDetector(
                        onTap: (){
///Set testing variable as true
setState(() {
  isDeletedRequested = true;
});
                        },
                        child: CustomButton(
                          buttonHeight: AppScreenUtil().screenHeight(24),
                          buttonWidth: AppScreenUtil().screenWidth(83),
                          buttonColor: blackColor,
                          borderRadius: 10.0,
                          buttonText: 'Yes',
                          buttonLabelStyle: clearDataAlertYesButtonLabelStyle,
                          boxShadow: const [
                            BoxShadow(
                                color: clearDataAlertYesButtonBoxShadowColor,
                                offset: Offset(0, 0),
                                blurRadius: 5)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ):(isDeletedRequested == true)?
              ///Enter password layout column
              Padding(
                padding:  EdgeInsets.only(left: AppScreenUtil().screenWidth(25),right: AppScreenUtil().screenWidth(25),top: AppScreenUtil().screenHeight(29),bottom: AppScreenUtil().screenHeight(34)),
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
///Enter a password 
Align(
                      alignment: Alignment.topLeft,

  child: Text('Enter Password',style: clearDataAlertEnterPasswordLabelStyle,)),
SizedBox(height: AppScreenUtil().screenHeight(16),),
        ColoredTextField(
          color: textFieldColor,
          controller: TextEditingController(),
          title: 'Password',
          textStyle: clearDataAlertPasswordLabelStyle,
        ),
          SizedBox(
                    height: AppScreenUtil().screenHeight(12),
                  ),

                  ///Buttons
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///Cancel button
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: CustomButton(
                            buttonHeight: AppScreenUtil().screenHeight(20),
                            buttonWidth: AppScreenUtil().screenWidth(70),
                            buttonColor: whiteColor,
                            borderRadius: 10.0,
                            buttonText: 'Cancel',
                            buttonLabelStyle: clearDataAlertEnterPasswordCancelButtonLabelStyle,
                            border: Border.all(
                                color: clearDataAlertNoButtonBorderColor, width: 1),
                          ),
                        ),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(5),
                        ),
                    
                        ///Submit button
                        GestureDetector(
                          onTap: (){
                    setState(() {
                      isDeleteSubmit = true;
                    });
                          },
                          child: CustomButton(
                                      buttonHeight: AppScreenUtil().screenHeight(20),
                            buttonWidth: AppScreenUtil().screenWidth(70),
                            buttonColor: blackColor,
                            borderRadius: 10.0,
                            buttonText: 'Submit',
                            buttonLabelStyle: clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                            boxShadow: const [
                              BoxShadow(
                                  color: clearDataAlertYesButtonBoxShadowColor,
                                  offset: Offset(0, 0),
                                  blurRadius: 5)
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                
                  ],
                ),
              ):SizedBox(height: 0,)
          )
        );
      },
    );
  }
}
