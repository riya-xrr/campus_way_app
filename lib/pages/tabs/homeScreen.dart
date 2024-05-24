import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:campus_way_app/widgets/features/popularRoutes.dart';
import 'package:campus_way_app/widgets/global/exploreCampusWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Container(
          margin: EdgeInsets.fromLTRB(AppConstants.screenWidth(context)/15, 10,AppConstants.screenWidth(context)/15, 0),
          height: AppConstants.screenHeight(context)/1.175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              homeScreenTitle(),
              mapContainer(),
              exploreCampusWidget(),
              PopularRoutes(),
            ],
          ),
        ),
      ),
    );
  }
}

class homeScreenTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.screenHeight(context)/11,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText('Welcome!!',
              style: AppTextStyles.bold,
          minFontSize: 18,),
          AutoSizeText('Navigate through our campus effortlessly and uncover hidden gems.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium,
          minFontSize: 10,
          maxFontSize: 13,),
        ],
      ),
    );
  }
}

class mapContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.screenHeight(context)/4,
      decoration: BoxDecoration(
        color: AppColors.light_green,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: AutoSizeText('Map PlaceHolder',
        style: AppTextStyles.semiBold,),
      ),
    );
  }
}
