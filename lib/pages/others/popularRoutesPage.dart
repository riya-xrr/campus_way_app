import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/styles.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:campus_way_app/widgets/features/exploreCampusDisplayWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopularRoutesPage extends StatefulWidget {
  @override
  State<PopularRoutesPage> createState() => _PopularRoutesPageState();
}

class _PopularRoutesPageState extends State<PopularRoutesPage> {
  static const double bradius = 15.0;
  final double longBoxWidth = 2.4;
  final double longBoxHeight = 3.5;
  final double shortBoxWidth = 2.4;
  final double shortBoxHeight = 5.5;
  final double paddingHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(AppConstants.screenWidth(context) / 15,
                10, AppConstants.screenWidth(context) / 15, 0),
            child: Column(
              children: [
                popularRoutesTopBar(),
                SizedBox(height: AppConstants.screenHeight(context)/paddingHeight,),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        children: [
                          Container(
                            width: AppConstants.screenWidth(context) / longBoxWidth,
                            height: AppConstants.screenHeight(context) / longBoxHeight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(bradius),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/img_belgiumWaffle.jpg'),
                                fit: BoxFit.cover,
                                width: AppConstants.screenWidth(context) / longBoxWidth,
                                height: AppConstants.screenHeight(context) / longBoxHeight,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(bradius),
                            ),
                          ),
                          SizedBox(height: AppConstants.screenHeight(context)/paddingHeight,),
                          Container(
                            width:
                            AppConstants.screenWidth(context) / shortBoxWidth,
                            height: AppConstants.screenHeight(context) / shortBoxHeight,
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(bradius),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/img_nBlock.jpg'),
                                fit: BoxFit.cover,
                                width:
                                AppConstants.screenWidth(context) / shortBoxWidth,
                                height:
                                AppConstants.screenHeight(context) / shortBoxHeight,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(bradius),
                            ),
                          ),
                          SizedBox(height: AppConstants.screenHeight(context)/paddingHeight,),
                          Container(
                            width: AppConstants.screenWidth(context) / longBoxWidth,
                            height: AppConstants.screenHeight(context) / longBoxHeight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(bradius),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/img_belgiumWaffle.jpg'),
                                fit: BoxFit.cover,
                                width: AppConstants.screenWidth(context) / longBoxWidth,
                                height: AppConstants.screenHeight(context) / longBoxHeight,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(bradius),
                            ),
                          ),
                          SizedBox(height: AppConstants.screenHeight(context)/paddingHeight,),
                          Container(
                            width:
                            AppConstants.screenWidth(context) / shortBoxWidth,
                            height: AppConstants.screenHeight(context) / shortBoxHeight,
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(bradius),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/img_nBlock.jpg'),
                                fit: BoxFit.cover,
                                width:
                                AppConstants.screenWidth(context) / shortBoxWidth,
                                height:
                                AppConstants.screenHeight(context) / shortBoxHeight,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(bradius),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width:
                            AppConstants.screenWidth(context) / shortBoxWidth,
                            height: AppConstants.screenHeight(context) / shortBoxHeight,
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(bradius),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/img_nBlock.jpg'),
                                fit: BoxFit.cover,
                                width:
                                AppConstants.screenWidth(context) / shortBoxWidth,
                                height:
                                AppConstants.screenHeight(context) / shortBoxHeight,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(bradius),
                            ),
                          ),
                          SizedBox(height: AppConstants.screenHeight(context)/paddingHeight,),
                          Container(
                            width: AppConstants.screenWidth(context) / longBoxWidth,
                            height: AppConstants.screenHeight(context) / longBoxHeight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(bradius),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/img_belgiumWaffle.jpg'),
                                fit: BoxFit.cover,
                                width: AppConstants.screenWidth(context) / longBoxWidth,
                                height: AppConstants.screenHeight(context) / longBoxHeight,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(bradius),
                            ),
                          ),
                          SizedBox(height: AppConstants.screenHeight(context)/paddingHeight,),
                          Container(
                            width:
                            AppConstants.screenWidth(context) / shortBoxWidth,
                            height: AppConstants.screenHeight(context) / shortBoxHeight,
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(bradius),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/img_nBlock.jpg'),
                                fit: BoxFit.cover,
                                width:
                                AppConstants.screenWidth(context) / shortBoxWidth,
                                height:
                                AppConstants.screenHeight(context) / shortBoxHeight,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(bradius),
                            ),
                          ),
                          SizedBox(height: AppConstants.screenHeight(context)/paddingHeight,),
                          Container(
                            width: AppConstants.screenWidth(context) / longBoxWidth,
                            height: AppConstants.screenHeight(context) / longBoxHeight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(bradius),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/img_belgiumWaffle.jpg'),
                                fit: BoxFit.cover,
                                width: AppConstants.screenWidth(context) / longBoxWidth,
                                height: AppConstants.screenHeight(context) / longBoxHeight,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(bradius),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class popularRoutesTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: AppColors.normal_black,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          height: AppConstants.screenHeight(context)/30,
          child: AutoSizeText(
            'Popular Routes',
            style: AppTextStyles.semiBold,
            maxFontSize: 24,
            minFontSize: 19,
          ),
        ),
      ],
    );
  }
}
