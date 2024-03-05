import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/services/functions/authFunctions.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CredentailsLogIn extends StatefulWidget{
  @override
  State<CredentailsLogIn> createState() => _CredentailsLogInState();
}

class _CredentailsLogInState extends State<CredentailsLogIn> {
  static const double borderWidth = 1;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      width: AppConstants.screenWidth(context)/1.5,
      height: AppConstants.screenHeight(context)/3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppConstants.screenHeight(context)/9,
          ),
          SizedBox(
            height: AppConstants.screenHeight(context)/9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppConstants.screenHeight(context)/30,
                  child: AutoSizeText('Email',
                    style: AppTextStyles.regular,
                    maxFontSize: 16,
                    minFontSize: 12,
                  ),
                ),
                SizedBox(
                  height: AppConstants.screenHeight(context)/25,
                  child: TextFormField(
                    style: AppTextStyles.light.copyWith(fontSize: 13),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.red,width: borderWidth)
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey, width: borderWidth)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.normal_black, width: borderWidth),
                      ),

                    ),
                    onChanged: (value) => setState(() {
                    }
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConstants.screenHeight(context)/40,
                  // child: AutoSizeText(
                  //   validateEmail(emailController.text),
                  //   style: AppTextStyles.light.copyWith(color: AppColors.red),
                  //   maxFontSize: 12,
                  //   minFontSize: 10,
                  // ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppConstants.screenHeight(context)/9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppConstants.screenHeight(context)/30,
                  child: AutoSizeText('Password',
                    style: AppTextStyles.regular,
                    maxFontSize: 16,
                    minFontSize: 12,
                  ),
                ),
                SizedBox(
                  height: AppConstants.screenHeight(context)/25,
                  child: TextFormField(
                    style: AppTextStyles.light.copyWith(fontSize: 13),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.red, width: borderWidth)
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey, width: borderWidth)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.normal_black, width: borderWidth),
                      ),
                      suffixIcon: Icon(CupertinoIcons.eye),
                    ),
                    onChanged: (value) => setState(() {
                    }
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConstants.screenHeight(context)/40,
                  // child: AutoSizeText(
                  //   //validateEmail(emailController.text),
                  //   style: AppTextStyles.light.copyWith(color: AppColors.red),
                  //   maxFontSize: 12,
                  //   minFontSize: 10,
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}