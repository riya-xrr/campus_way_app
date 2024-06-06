import 'package:campus_way_app/auth/login.dart';
import 'package:campus_way_app/auth/signup.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/styles.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget{
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: AppConstants.screenWidth(context),
            child: Container(
                height: 2*(AppConstants.screenWidth(context)/3),
                width: 2*(AppConstants.screenWidth(context)/3),
                alignment: Alignment.topRight,
                child: Image(image: AssetImage('assets/images/img_map.png'))),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, AppConstants.screenHeight(context)/20, 0, AppConstants.screenHeight(context)/20),
            child: RichText(
              text: TextSpan(

                style: AppTextStyles.extrabold.copyWith(
                    color: AppColors.normal_green,
                    fontSize: 37),
                children: [
                  TextSpan(
                      text: 'Welcome\nto\n'
                  ),
                  TextSpan(
                    text: 'C',
                    style: AppTextStyles.extrabold.copyWith(
                        color: AppColors.normal_yellow),
                  ),
                  TextSpan(
                      text: 'ampus'
                  ),
                  TextSpan(
                    text: 'W',
                    style: AppTextStyles.extrabold.copyWith(
                        color: AppColors.normal_yellow),
                  ),
                  TextSpan(
                      text: 'ay'
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp())
              );
            },
            child: landingPageOptions(bgColor: AppColors.white,
                borderColor: AppColors.normal_green,
                text: 'Sign Up'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
              },
              child: landingPageOptions(bgColor: AppColors.normal_green,
                  borderColor: AppColors.white,
                  text: 'Log In'),
            ),
          )
        ],
      ),
    );
  }
}