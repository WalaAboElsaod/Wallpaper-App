import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/utils/app_string.dart';
import 'package:wallpaper_app/core/utils/color_manger.dart';
import 'package:wallpaper_app/core/utils/fonts_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      
      
         Text.rich(
          textAlign:TextAlign.center,

       TextSpan(
        children: [
          TextSpan(
              text:AppString.appName1,

              style:  TextStyle(
                  color: ColorManager.black,

                  fontWeight: FontWeightManager.semiBold
                  ,fontSize: 20

              )
          ),

          TextSpan(
              text:AppString.appName2,

              style:  TextStyle(
                  color: ColorManager.primary
                  ,fontSize: 20,

                  fontWeight: FontWeightManager.semiBold

              )
          )
        ],


       )
      ),
    );
  }
}
