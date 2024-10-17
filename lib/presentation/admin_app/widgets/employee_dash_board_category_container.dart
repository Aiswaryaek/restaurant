import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class EmployeeDashBoardCategoryContainer extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subTitle;
  final Color containerColor;
  final Color arrowColor;
  final Color titleColor;
  final Color subTitleColor;
  const EmployeeDashBoardCategoryContainer({super.key,required this.arrowColor,required this.containerColor,required this.iconPath,required this.subTitle,required this.title,required this.subTitleColor,required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return  Container(
            width: AppScreenUtil().screenWidth(98.91),
            height: AppScreenUtil().screenHeight(79.05),
            color: Colors.transparent,
          child: Stack(
            children: [
              Padding(
                padding:  EdgeInsets.only(right: AppScreenUtil().screenWidth(7.61)),
                child: Container(
                  height: AppScreenUtil().screenHeight(79.05),
                  // width: AppScreenUtil().screenWidth(91.3),
                  decoration: BoxDecoration(color:containerColor,boxShadow:const [BoxShadow(offset: Offset(0, 0),blurRadius: 7,color:employeeDashBoardCategoryContainerColor )] ),
                  child: Padding(
                    padding:  EdgeInsets.only(top: AppScreenUtil().screenHeight(7.8),right: AppScreenUtil().screenWidth(11.25),bottom: AppScreenUtil().screenHeight(8.5),left: AppScreenUtil().screenWidth(8.43) ),
                    child: Column(children: [
                      Align(
                        
                        alignment: Alignment.topRight,

                        child: SvgPicture.asset(iconPath,)),
                        SizedBox(height: AppScreenUtil().screenHeight(9),),
                      const  Spacer(),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                        color: Colors.transparent,
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                 Text(title,style:employeeDashBoardCategoryTitleLabelStyle(titleColor) ,),
                              SizedBox(height: AppScreenUtil().screenHeight(1.47),),
                              Text(subTitle,style: employeeDashBoardCategorySubTitleLabelStyle(subTitleColor),),
                            const  SizedBox()
                          ],
                         ),
                       ),
                     ],
                   )

                    ],),
                  ),
                ),
              ),
                     Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:  EdgeInsets.only(bottom: AppScreenUtil().screenHeight(4.76)),
                child: SvgPicture.asset(ImageCons.imgEmployeeDashBoardCategoryArrow,height: 15.21,width: 15.21,color:arrowColor ,),
              ))
            ],
          ),
        );
  }
}