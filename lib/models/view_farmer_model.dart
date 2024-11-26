import 'package:cloud_firestore/cloud_firestore.dart';

class ViewFarmerModel {
  String? id;
  String farmerAppUserId;
  String? customerAppUserId;
  DateTime createdAt;
  String? uid;

  ViewFarmerModel({
    this.id,
    required this.farmerAppUserId,
    this.customerAppUserId,
    required this.createdAt,
    this.uid,
  });

  factory ViewFarmerModel.fromFire(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return ViewFarmerModel(
      id: document.id,
      farmerAppUserId: data['farmerId'],
      customerAppUserId: data['customerId'],
      createdAt: DateTime.parse(data['createdAt']),
      uid: data['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'farmerId': farmerAppUserId,
      'customerId': customerAppUserId,
      'createdAt': createdAt.toIso8601String(),
      'uid': uid,
    };
  }
}
