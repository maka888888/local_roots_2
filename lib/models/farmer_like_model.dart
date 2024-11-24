import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/farmer_short_model.dart';

class FarmerLikeModel {
  String id;
  FarmerShortModel farmerShort;
  String customerId;
  DateTime createdAt;
  String? uid;

  FarmerLikeModel({
    required this.id,
    required this.farmerShort,
    required this.customerId,
    required this.createdAt,
    this.uid,
  });

  factory FarmerLikeModel.fromFire(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return FarmerLikeModel(
      id: document.id,
      farmerShort: FarmerShortModel.fromFire(data['farmerShort']),
      customerId: data['customerId'],
      createdAt: DateTime.parse(data['createdAt']),
      uid: data['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'farmerShort': farmerShort.toJson(),
      'customerId': customerId,
      'createdAt': createdAt.toIso8601String(),
      'uid': uid,
    };
  }
}
