import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/auth/signup.dart';
import 'package:campus_way_app/pages/tabs/homeScreen.dart';
import 'package:campus_way_app/pages/tabs/navbar.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/styles.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogIn extends StatefulWidget{
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  static const double borderWidth = 1;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  bool obscurePassword = true;

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
                  SizedBox(
                    width: AppConstants.screenWidth(context)/1.5,
                    height: AppConstants.screenHeight(context)/3,
                    child: Form(
                      key: loginFormKey,
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
                                    controller: emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter email';
                                      }
                                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                    style: AppTextStyles.light.copyWith(fontSize: 13),
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide(color: AppColors.red,width: borderWidth),
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
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      }
                                      return null;
                                    },
                                    obscureText: obscurePassword,
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
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              obscurePassword = !obscurePassword; // Toggle password visibility
                                            });
                                          },
                                          child: Icon(
                                            obscurePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                                          ),
                                        ),
                                      ),
                                      errorMaxLines: 1,
                                    ),
                                    onChanged: (value) => setState(() {
                                    }
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: AppConstants.screenHeight(context)/40),
                child: Row(
                  children: [
                    SizedBox(
                      width: AppConstants.screenWidth(context)/2,
                    ),
                    InkWell(
                        onTap: () async {
                          String message = '';
                          if (loginFormKey.currentState!.validate()) {
                            try {
                              await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => Navbar()));
                              });
                            } on FirebaseAuthException catch (e) {
                              switch (e.code) {
                                case 'invalid-credential':
                                  message = 'Invalid Credentials';
                                  break;
                                default:
                                  message = e.code;
                                  break;
                              }
                              Fluttertoast.showToast(
                                msg: message,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.SNACKBAR,
                                backgroundColor: Colors.black54,
                                textColor: Colors.white,
                                fontSize: 14.0,
                              );
                            }
                          }
                        },
                        child: greenContainer()),
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
