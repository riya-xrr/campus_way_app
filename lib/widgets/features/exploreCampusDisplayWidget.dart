import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/services/models/campusLocation.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExploreCampusDisplayWidget extends StatelessWidget {
  final int typeId;
  const ExploreCampusDisplayWidget({super.key, required this.typeId});
  static const double bradius = 15.0;
  static List<String> categories = ['Food Courts','Academic Buildings','Games','Libraries','Hostels','Temple','Admin Cell','Others'];

  Future<List<CampusLocation>> fetchCampusLocations() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('exploreCampus')
        .where('typeId', isEqualTo: typeId)
        .get();
    return querySnapshot.docs.map((doc) => CampusLocation.fromFirestore(doc)).toList();
  }

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          categories[typeId-1],
          style: AppTextStyles.semiBold,
          maxFontSize: 24,
          minFontSize: 16,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          height: AppConstants.screenHeight(context)/1.8,
          child: FutureBuilder<List<CampusLocation>>(
          future: fetchCampusLocations(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No locations found'));
            }
            List<CampusLocation> locations = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
              itemCount: locations.length,
              itemBuilder: (context,index){
                CampusLocation location = locations[index];
                return FutureBuilder<Uint8List?>(
                  future: loadImage(location.imagePath),
                  builder: (context, imageSnapshot) {
                    if (imageSnapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child:Container(
                          width: AppConstants.screenWidth(context)/2.7,
                          height: AppConstants.screenHeight(context)/4.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(bradius),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: SizedBox(
                                width: AppConstants.screenWidth(context)/2.7,
                                height: AppConstants.screenHeight(context)/4.3,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(bradius),
                                  ),
                                ),
                              ),),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(bradius),
                          ),
                        ),
                      );
                    }
                    if (imageSnapshot.hasError || !imageSnapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          width: AppConstants.screenWidth(context)/2.7,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(bradius),
                            color: Colors.grey[300]!,
                          ),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child:Stack(
                        children: [
                          Container(
                            width: AppConstants.screenWidth(context)/2.7,
                            height: AppConstants.screenHeight(context)/4.3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(bradius),
                              child: Image.memory(imageSnapshot.data!,
                                fit: BoxFit.cover,
                                width: AppConstants.screenWidth(context)/2.7,
                                height: AppConstants.screenHeight(context)/4.3,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(bradius),
                            ),
                          ),
                          Container(
                            width: AppConstants.screenWidth(context)/2.7,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(bradius), topRight: Radius.circular(bradius)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter, // Adjust gradient direction as needed
                                end: Alignment.bottomCenter, // Adjust gradient direction as needed
                                colors: [
                                  AppColors.normal_green.withOpacity(0.5), // Adjust color and opacity
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top:0,
                            left:  AppConstants.screenWidth(context)/21.6,
                            child: Center(
                              child: AutoSizeText(location.name,
                                style: AppTextStyles.regular.copyWith(
                                    color: AppColors.white),
                                minFontSize: 12,
                                maxFontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
                ),
        ),
      ],
    );
  }
}


// Container(
//   width: AppConstants.screenWidth(context)/2.7,
//   height: 30,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.only(topLeft: Radius.circular(bradius), topRight: Radius.circular(bradius)),
//     gradient: LinearGradient(
//       begin: Alignment.topCenter, // Adjust gradient direction as needed
//       end: Alignment.bottomCenter, // Adjust gradient direction as needed
//       colors: [
//         AppColors.normal_green.withOpacity(0.5), // Adjust color and opacity
//         Colors.transparent,
//       ],
//     ),
//   ),
// ),
// Positioned(
//   top:0,
//   left: 10,
//   child: Center(
//     child: AutoSizeText(location.name,
//       style: AppTextStyles.regular.copyWith(
//           color: AppColors.white),
//       minFontSize: 12,
//       maxFontSize: 16,
//     ),
//   ),
// )
