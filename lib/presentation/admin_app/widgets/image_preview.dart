


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/extensions/widget_extension.dart';
import 'package:restaurant/core/utils/image_utils.dart';
import 'package:restaurant/utiles/app_screen_util.dart';


class ImagePreview extends StatelessWidget {
  final String url;

  const ImagePreview({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: InteractiveViewer(
              child: imageNetwork(
                url: url,
              ),
            ),
          ),
        ),
        Positioned(
          right: AppScreenUtil().screenWidth(20),
          top:AppScreenUtil().screenWidth(30) ,
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ).backgroundColor(Colors.white).gestures(onTap: () => Get.back()),
        ),
      ],
    );
  }
}