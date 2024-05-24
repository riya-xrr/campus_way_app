import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:flutter/cupertino.dart';

class PopularRoutes extends StatefulWidget{
  @override
  State<PopularRoutes> createState() => _PopularRoutesState();
}

class _PopularRoutesState extends State<PopularRoutes> {
  static const double bradius = 15.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: SizedBox(
        height: AppConstants.screenHeight(context)/3.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText('Popular Routes',
            style: AppTextStyles.semiBold,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: AppConstants.screenWidth(context)/2.7,
                  height: AppConstants.screenHeight(context)/4.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(bradius),
                    child: Image(
                      image: AssetImage('assets/images/img_belgiumWaffle.jpg'),
                      fit: BoxFit.cover,
                      width: AppConstants.screenWidth(context)/2.7,
                      height: AppConstants.screenHeight(context)/4.3,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(bradius),
                  ),
                ),
                SizedBox(
                  height: AppConstants.screenHeight(context)/4.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: AppConstants.screenWidth(context)/2.3,
                        height: AppConstants.screenHeight(context)/6.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(bradius),
                          child: Image(
                            image: AssetImage('assets/images/img_nBlock.jpg'),
                            fit: BoxFit.cover,
                            width: AppConstants.screenWidth(context)/2.3,
                            height: AppConstants.screenHeight(context)/6.2,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(bradius),
                        ),
                      ),
                      Container(
                        width: AppConstants.screenWidth(context)/2.3,
                        height: AppConstants.screenHeight(context)/22,
                        child: Center(child: AutoSizeText('View All',
                          style: AppTextStyles.semiBold.copyWith(
                              color: AppColors.white,),
                          maxFontSize: 20,
                        )
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.normal_green
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
