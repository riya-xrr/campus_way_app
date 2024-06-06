// card styles, container styles, button styles

import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget{
  final ImageProvider<Object> icon; // Change type to ImageProvider<Object>
  final Color color;
  final Text category;

  CategoryContainer({
    required this.category,
    required this.icon,
    this.color= AppColors.light_green,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: AppConstants.screenWidth(context)/4.7,
      height: AppConstants.screenWidth(context)/4.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.normal_green,
            backgroundImage: icon,
            radius: AppConstants.screenWidth(context)/13,
          ),
          SizedBox(
            height: AppConstants.screenHeight(context)/40,
            child: AutoSizeText(category.data.toString(), // Extract String from Text widget
              style: AppTextStyles.regular,
              maxLines: 1,
              minFontSize: 9,
              maxFontSize: 12,),
          )
        ],
      ),
    );
  }

}


class greenContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double bRadius = AppConstants.screenHeight(context)/12;
    return Container(
      height: AppConstants.screenHeight(context)/14,
      width: AppConstants.screenWidth(context)/2,
      decoration: BoxDecoration(
          color: AppColors.normal_green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(bRadius),
            bottomLeft: Radius.circular(bRadius),
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AutoSizeText('Get Started',
            style: AppTextStyles.medium.copyWith(
                color: AppColors.white
            ),
            minFontSize: 18,
            maxFontSize: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Icon(Icons.arrow_right_alt,
              color: AppColors.white,),
          )
        ],
      ),
    );
  }

}

class landingPageOptions extends StatelessWidget{
  final Color bgColor;
  final Color borderColor;
  final String text;

  landingPageOptions({
    required this.bgColor,
    required this.borderColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double bRadius = AppConstants.screenHeight(context)/12;
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: AppConstants.screenHeight(context)/16.5,
        width: AppConstants.screenWidth(context)/2.7,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(Radius.circular(bRadius)),
            border: Border.all(
                color: AppColors.normal_green,
                width: 2
            )
        ),
        child: AutoSizeText(text,
          style: AppTextStyles.medium.copyWith(
              color: borderColor
          ),
          minFontSize: 18,
          maxFontSize: 20,
        ),
      ),
    );
  }
}