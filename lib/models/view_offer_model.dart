import 'package:cloud_firestore/cloud_firestore.dart';

class ViewOfferModel {
  String? id;
  String offerId;
  String? customerAppUserId;
  DateTime createdAt;
  String? uid;

  ViewOfferModel({
    this.id,
    required this.offerId,
    this.customerAppUserId,
    required this.createdAt,
    this.uid,
  });

  factory ViewOfferModel.fromFire(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return ViewOfferModel(
      id: document.id,
      offerId: data['offerId'],
      customerAppUserId: data['customerId'],
      createdAt: DateTime.parse(data['createdAt']),
      uid: data['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'offerId': offerId,
      'customerId': customerAppUserId,
      'createdAt': createdAt.toIso8601String(),
      'uid': uid,
    };
  }
}
