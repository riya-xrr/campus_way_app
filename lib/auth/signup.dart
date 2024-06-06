import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/auth/login.dart';
import 'package:campus_way_app/pages/tabs/homeScreen.dart';
import 'package:campus_way_app/pages/tabs/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/styles.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _firebaseAuth = FirebaseAuth.instance;
  static const double borderWidth = 1;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscureConfirmPassword = true;
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
                    height: AppConstants.screenHeight(context) / 15,
                    child: AutoSizeText(
                      'Sign Up',
                      style: AppTextStyles.semiBold
                          .copyWith(color: AppColors.normal_green),
                      minFontSize: 28,
                      maxFontSize: 36,
                    ),
                  ),
                  SizedBox(
                    height: AppConstants.screenHeight(context) / 40,
                  ),
                  SizedBox(
                    width: AppConstants.screenWidth(context) / 1.5,
                    height: AppConstants.screenHeight(context) / 3,
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppConstants.screenHeight(context) / 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                  AppConstants.screenHeight(context) / 30,
                                  child: AutoSizeText(
                                    'Email',
                                    style: AppTextStyles.regular,
                                    maxFontSize: 16,
                                    minFontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  AppConstants.screenHeight(context) / 25,
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
                                    style: AppTextStyles.light
                                        .copyWith(fontSize: 13),
                                    decoration: InputDecoration(
                                      // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.grey,
                                              width: borderWidth)),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.normal_black,
                                            width: borderWidth),
                                      ),
                                    ),
                                    onChanged: (value) => setState(() {}),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight(context) / 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                  AppConstants.screenHeight(context) / 30,
                                  child: AutoSizeText(
                                    'Password',
                                    style: AppTextStyles.regular,
                                    maxFontSize: 16,
                                    minFontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  AppConstants.screenHeight(context) / 25,
                                  child: TextFormField(
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      }
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                    style: AppTextStyles.light
                                        .copyWith(fontSize: 13),
                                    obscureText: obscurePassword, // Toggle password visibilitys
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.grey, width: borderWidth),
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
                                    onChanged: (value) => setState(() {}),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight(context) / 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                  AppConstants.screenHeight(context) / 30,
                                  child: AutoSizeText(
                                    'Confirm Password',
                                    style: AppTextStyles.regular,
                                    maxFontSize: 16,
                                    minFontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  AppConstants.screenHeight(context) / 25,
                                  child:
                                  TextFormField(
                                    controller: confirmPasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      } else if (value != passwordController.text) {
                                        return 'Passwords do not match';
                                      }
                                      return null;
                                    },
                                    style: AppTextStyles.light.copyWith(fontSize: 13),
                                    obscureText: obscureConfirmPassword, // Toggle password visibility
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.grey, width: borderWidth),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.normal_black, width: borderWidth),
                                      ),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              obscureConfirmPassword = !obscureConfirmPassword; // Toggle password visibility
                                            });
                                          },
                                          child: Icon(
                                            obscureConfirmPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                                          ),
                                        ),
                                      ),
                                      errorMaxLines: 1, // Ensure space for two lines of error message
                                    ),
                                    onChanged: (value) => setState(() {}),
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
                padding: EdgeInsets.only(
                    top: AppConstants.screenHeight(context) / 40),
                child: Row(
                  children: [
                    SizedBox(
                      width: AppConstants.screenWidth(context) / 2,
                    ),
                    InkWell(
                        onTap: () async {
                          String message = '';
                          if (formKey.currentState!.validate()) {
                            try {
                              await _firebaseAuth
                                  .createUserWithEmailAndPassword(
                                // instantiated earlier on: final _firebaseAuth = FirebaseAuth.instance;
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => Navbar(selectedIndex: 0,)));
                              }
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                message = 'The password provided is too weak.';
                              } else if (e.code == 'email-already-in-use') {
                                message =
                                'An account already exists with that email.';
                              }
                              Fluttertoast.showToast(
                                msg: message,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.SNACKBAR,
                                backgroundColor: Colors.black54,
                                textColor: Colors.white,
                                fontSize: 14.0,
                              );
                            } catch (e) {
                              Fluttertoast.showToast(
                                msg: "Failed: $e",
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
                  padding: EdgeInsets.only(
                      top: AppConstants.screenHeight(context) / 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Already have account?  ',
                        style: AppTextStyles.medium,
                        minFontSize: 9,
                        maxFontSize: 11,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn()),
                          );
                        },
                        child: AutoSizeText(
                          'Log In',
                          style: AppTextStyles.medium
                              .copyWith(color: AppColors.normal_green),
                          minFontSize: 9,
                          maxFontSize: 11,
                        ),
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
