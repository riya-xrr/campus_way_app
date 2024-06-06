import 'package:campus_way_app/services/models/campusLocation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';

class ExploreCampusScreen extends StatelessWidget {
  const ExploreCampusScreen({Key? key}) : super(key: key);

  Future<List<CampusLocation>> fetchCampusLocations() async {
    int typeId = 1;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('exploreCampus')
        .where('typeId', isEqualTo: typeId)
        .get();
    return querySnapshot.docs.map((doc) => CampusLocation.fromFirestore(doc)).toList();
  }

  Future<Uint8List?> loadImage(String imagePath) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(imagePath);
      const oneMegabyte = 1024 * 1024;
      return await ref.getData(oneMegabyte);
    } on FirebaseException catch (e) {
      print('Error loading image: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Campus'),
      ),
      body: FutureBuilder<List<CampusLocation>>(
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
          return ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              CampusLocation location = locations[index];
              return FutureBuilder<Uint8List?>(
                future: loadImage(location.imagePath),
                builder: (context, imageSnapshot) {
                  if (imageSnapshot.connectionState == ConnectionState.waiting) {
                    return ListTile(
                      title: Text(location.name),
                      subtitle: Text(location.type),
                      leading: Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  }
                  if (imageSnapshot.hasError || !imageSnapshot.hasData) {
                    return ListTile(
                      title: Text(location.name),
                      subtitle: Text(location.type),
                      leading: Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                      ),
                    );
                  }
                  return ListTile(
                    title: Text(location.name),
                    subtitle: Text(location.type),
                    leading: Image.memory(
                      imageSnapshot.data!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// class ImageScreen extends StatefulWidget {
//   @override
//   _ImageScreenState createState() => _ImageScreenState();
// }
//
// class _ImageScreenState extends State<ImageScreen> {
//   Uint8List? _imageData;
//   bool _isLoading = true;
//   String _errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _loadImage();
//   }
//
//   Future<void> _loadImage() async {
//     final storageRef = FirebaseStorage.instance.ref();
//     final islandRef = storageRef.child("food_courts/FC_kathi_junction.jpg");
//
//     try {
//       const oneMegabyte = 1024 * 1024;
//       final Uint8List? data = await islandRef.getData(oneMegabyte);
//       setState(() {
//         _imageData = data;
//         _isLoading = false;
//       });
//     } on FirebaseException catch (e) {
//       setState(() {
//         _errorMessage = e.message ?? 'An unknown error occurred';
//         _isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image from Firebase Storage'),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: _isLoading
//               ? CircularProgressIndicator()
//               : _errorMessage.isNotEmpty
//               ? Text(_errorMessage)
//               : _imageData != null
//               ? Image.memory(_imageData!)
//               : Text('No image found'),
//         ),
//       ),
//     );
//   }
// }

