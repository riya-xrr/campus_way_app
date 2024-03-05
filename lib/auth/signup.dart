import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/auth/login.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/styles.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:campus_way_app/widgets/features/credentialsSignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppConstants.screenHeight(context)/15,
                    child: AutoSizeText('Sign Up',
                    style: AppTextStyles.semiBold.copyWith
                      (
                      color: AppColors.normal_green),
                      minFontSize: 28,
                      maxFontSize: 36,
                    ),
                  ),
                  SizedBox(
                    height: AppConstants.screenHeight(context)/40,
                  ),
                  Credentails(),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: AppConstants.screenHeight(context)/40),
                child: Row(
                  children: [
                    SizedBox(
                      width: AppConstants.screenWidth(context)/2,
                    ),
                    greenContainer(),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: AppConstants.screenHeight(context)/40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText('Already have account?  ',
                        style: AppTextStyles.medium,
                        minFontSize: 9,
                        maxFontSize: 11,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()),
                          );
                        },
                        child: AutoSizeText('Log In',
                          style: AppTextStyles.medium.copyWith(
                              color: AppColors.normal_green),
                          minFontSize: 9,
                          maxFontSize: 11,),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
