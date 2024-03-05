import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/auth/signup.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/styles.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:campus_way_app/widgets/features/credentialsLogIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget{
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                    child: AutoSizeText('Log In',
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
                  CredentailsLogIn(),
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
                     AutoSizeText('New to CampusWay?  ',
                     style: AppTextStyles.medium,
                     minFontSize: 9,
                     maxFontSize: 11,),
                     InkWell(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()),
                         );
                       },
                       child: AutoSizeText('Sign up',
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
