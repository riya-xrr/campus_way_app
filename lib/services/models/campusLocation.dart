import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CampusLocation {
  final String name;
  final String type;
  final String imagePath;

  CampusLocation({required this.name, required this.type, required this.imagePath});

  factory CampusLocation.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CampusLocation(
      name: data['name'] ?? '',
      type: data['type'] ?? '',
      imagePath: data['image'] ?? '',
    );
  }

  Future<String> getDownloadUrl() async {
    final ref = FirebaseStorage.instance.ref().child(imagePath);
    return await ref.getDownloadURL();
  }
}