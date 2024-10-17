import 'package:flutter/material.dart';
import 'package:restaurant/presentation/user_app/widgets/kot_dotted_border_painter.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class KotCancelledItem extends StatelessWidget {
  final String itemName;
  final String itemCount;
  const KotCancelledItem({super.key,required this.itemCount,required this.itemName});

  @override
  Widget build(BuildContext context) {
    return    CustomPaint(
                      painter: KotDottedBorderPainter(),
                      child: Container(
                        width: double.infinity,
                        height: AppScreenUtil().screenHeight(26),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              itemName,
                              style: pangramRegular(
                                  size: 9.0, color: whiteColor.withOpacity(0.3)),
                            ),
                            Text(
                              itemCount,
                              style: pangramRegular(
                                  size: 9.0, color: whiteColor.withOpacity(0.3)),
                            ),
                          ],
                        ),
                      ),
                    );
  }
}