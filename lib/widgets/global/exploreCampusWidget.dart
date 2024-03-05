import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/styles.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:flutter/cupertino.dart';

class exploreCampusWidget extends StatefulWidget{
  @override
  State<exploreCampusWidget> createState() => _exploreCampusWidgetState();
}

class _exploreCampusWidgetState extends State<exploreCampusWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.screenHeight(context)/6.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutoSizeText('Explore Campus With Us',
              style: AppTextStyles.semiBold,),
              AutoSizeText('View All',
              style: AppTextStyles.medium.copyWith(color: AppColors.normal_green),
              maxFontSize: 12,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryContainer(
                  category: Text('Food Courts'),
                  icon: AssetImage('assets/category_icons/cic_foodcourts_dark.png'),
                  color: AppColors.normal_green,),
              CategoryContainer(
                category: Text('Buildings'),
                icon: AssetImage('assets/category_icons/cic_buildings_dark.png'),
                color: AppColors.normal_green,),
              CategoryContainer(
                category: Text('Games'),
                icon: AssetImage('assets/category_icons/cic_games_dark.png'),
                color: AppColors.normal_green,),
              CategoryContainer(
                category: Text('Libraries'),
                icon: AssetImage('assets/category_icons/cic_libraries_dark.png'),
                color: AppColors.normal_green,),
            ],
          ),
        ],
      ),
    );
  }
}