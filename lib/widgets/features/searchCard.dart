import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/services/models/campusLocation.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchCard extends StatelessWidget {
  final CampusLocation? locationInfoCard;

  const SearchCard({super.key, required this.locationInfoCard});

  Future<Uint8List?> loadImage(String imagePath) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(imagePath);
      const oneMegabyte = 3 * 1024 * 1024;
      return await ref.getData(oneMegabyte);
    } on FirebaseException catch (e) {
      print('Error loading image: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (locationInfoCard == null) {
      return Center(child: Text('Location not found'));
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(AppConstants.screenWidth(context) / 10, 20,
          AppConstants.screenWidth(context) / 10, 0),
      child: SizedBox(
        width: AppConstants.screenWidth(context),
        height: AppConstants.screenHeight(context) / 2.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: AutoSizeText(
                locationInfoCard!.name,
                style: AppTextStyles.semiBold.copyWith(
                  letterSpacing: -0.2,
                ),
                maxFontSize: 20,
                minFontSize: 17,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
                  decoration: BoxDecoration(
                    color: AppColors.light_green,
                    border: Border.all(
                      color: AppColors.normal_black,
                      width: 1.2,
                    ),
                    borderRadius:
                    BorderRadius.circular(AppConstants.screenWidth(context) / 5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.directions,
                        size: 19,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        child: AutoSizeText(
                          'Get Directions',
                          style: AppTextStyles.semiBold.copyWith(letterSpacing: -0.3),
                          minFontSize: 12,
                          maxFontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.normal_black,
                      width: 1.2,
                    ),
                    borderRadius:
                    BorderRadius.circular(AppConstants.screenWidth(context) / 5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        fetchIcon(locationInfoCard!.type),
                        size: 17,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        child: AutoSizeText(
                          locationInfoCard!.type,
                          style: AppTextStyles.semiBold.copyWith(letterSpacing: -0.3),
                          minFontSize: 12,
                          maxFontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppConstants.screenHeight(context) / 4.1,
              width: AppConstants.screenWidth(context) / 1.28,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FutureBuilder<Uint8List?>(
                  future: loadImage(locationInfoCard!.imagePath),
                  builder: (context, imageSnapshot) {
                    if (imageSnapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: SizedBox(
                            width: AppConstants.screenWidth(context)/4.1,
                            height: AppConstants.screenHeight(context)/1.28,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),),
                      );
                    }
                    if (imageSnapshot.hasError || !imageSnapshot.hasData) {
                      return Container(
                        height: AppConstants.screenHeight(context) / 4.1,
                        width: AppConstants.screenWidth(context) / 1.28,
                        decoration: BoxDecoration(
                          color: Colors.grey[300]!,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    }
                    return Image.memory(imageSnapshot.data!,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData? fetchIcon(locationType) {
    if(locationType == 'Food Court'){
      return Icons.fastfood;
    }
    if(locationType == 'Hostel'){
      return Icons.location_on;
    }
    if(locationType == 'Academic Building'){
      return Icons.location_city_rounded;
    }
    if(locationType == 'Games'){
      return Icons.sports_football;
    }
    if(locationType == 'Library'){
      return Icons.menu_book;
    }
    if(locationType == 'Admin Cell'){
      return Icons.manage_accounts;
    }
    if(locationType == 'Temple'){
      return Icons.account_balance;
    }
    if(locationType == 'Other'){
      return Icons.location_on;
    }
  }
}


// class searchCard extends StatelessWidget{
//   final Future<List<CampusLocation>> locationInfoCard;
//
//   const searchCard({super.key, required this.locationInfoCard, });
//
//   @override
//   Widget build(BuildContext context) {
//    return Padding(
//        padding: EdgeInsets.fromLTRB(AppConstants.screenWidth(context)/10, 20,AppConstants.screenWidth(context)/10, 0),
//        child: SizedBox(
//          width: AppConstants.screenWidth(context),
//          height: AppConstants.screenHeight(context)/2.9,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: [
//              Container(
//                alignment: Alignment.bottomLeft,
//                child: AutoSizeText('Kathi Junction',
//                style: AppTextStyles.semiBold.copyWith(
//                  letterSpacing: -0.2,
//                ),
//                maxFontSize: 20,
//                minFontSize: 17,),
//              ),
//              Row(
//                children: [
//                  Container(
//                    padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
//                    // width: AppConstants.screenWidth(context)/3,
//                    decoration: BoxDecoration(
//                      color: AppColors.light_green,
//                      border: Border.all(
//                        color: AppColors.normal_black,
//                        width: 1.2,
//                      ),
//                      borderRadius: BorderRadius.circular(AppConstants.screenWidth(context)/5),
//                    ),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: [
//                        Icon(Icons.directions,
//                        size: 19,),
//                        SizedBox(width: 3,),
//                        Container(child: AutoSizeText('Get Directions',
//                        style: AppTextStyles.semiBold.copyWith(letterSpacing: -0.3),
//                        minFontSize: 12,
//                        maxFontSize: 13,),
//                        ),
//                      ],
//                    ),
//                  ),
//                  SizedBox(width: 10,),
//                  Container(
//                    padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
//                    // width: AppConstants.screenWidth(context)/3,
//                    decoration: BoxDecoration(
//                      color: AppColors.white,
//                      border: Border.all(
//                        color: AppColors.normal_black,
//                        width: 1.2,
//                      ),
//                      borderRadius: BorderRadius.circular(AppConstants.screenWidth(context)/5),
//                    ),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: [
//                        Icon(Icons.fastfood,
//                          size: 17,),
//                        SizedBox(width: 3,),
//                        Container(child: AutoSizeText('Food Courts',
//                          style: AppTextStyles.semiBold.copyWith(letterSpacing: -0.3),
//                          minFontSize: 12,
//                          maxFontSize: 13,),
//                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//              SizedBox(
//                  height: AppConstants.screenHeight(context)/4.1,
//                  width: AppConstants.screenWidth(context)/1.28,
//                  child: ClipRRect(
//                    borderRadius: BorderRadius.circular(8),
//                    child: Image(image: AssetImage('assets/images/img_belgiumWaffle.jpg'),
//                    fit: BoxFit.cover,
//                    ),
//                  ),
//              ),
//            ],
//          ),
//        ),
//    );
//   }
// }
