import 'package:flutter/material.dart';
import 'package:restaurant/presentation/user_app/widgets/kot_dotted_border_painter.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class KotItemLayout extends StatelessWidget {
  final String itemName;
  final String itemCount;
  final bool isNoteAdded;
  const KotItemLayout(
      {super.key,
      required this.itemName,
      required this.itemCount,
      required this.isNoteAdded});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(8)),
      child: CustomPaint(
        painter: KotDottedBorderPainter(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: pangramMedium(size: 10.0, color: whiteColor),
                  ),
                  Text(
                    itemCount,
                    style: pangramMedium(size: 10.0, color: whiteColor),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(8),
              ),
              Visibility(
                visible: isNoteAdded,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: AppScreenUtil().screenHeight(7.5)),
                  child: Container(
                    height: AppScreenUtil().screenHeight(28),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: whiteColor, width: 0.5)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: AppScreenUtil().screenHeight(4),
                          left: AppScreenUtil().screenWidth(7),
                          bottom: AppScreenUtil().screenHeight(4),right:AppScreenUtil().screenWidth(7) ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Note : ',
                            style: pangramRegular(size: 7.0, color: whiteColor),
                          ),
                          Expanded(
                            child: EditableText(
                              
                                cursorHeight: AppScreenUtil().screenHeight(5),
                                maxLines: 6,
                                controller: TextEditingController(),
                                focusNode: FocusNode(),
                                style: pangramRegular(
                                    size: 7.0, color: whiteColor),
                                cursorColor: whiteColor,
                                backgroundCursorColor: whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
