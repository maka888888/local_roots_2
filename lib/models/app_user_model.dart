import 'package:cloud_firestore/cloud_firestore.dart';

import 'customer_model.dart';

class AppUserModel {
  String id;
  String email;
  bool isCustomer;
  CustomerModel? customer;
  bool isFarmer;
  bool isAdmin;
  bool isDistributor;
  DateTime lastLogin;
  DateTime createdAt;
  DateTime updatedAt;
  String uid;

  AppUserModel({
    required this.id,
    required this.email,
    required this.isCustomer,
    this.customer,
    required this.isFarmer,
    required this.isAdmin,
    required this.isDistributor,
    required this.lastLogin,
    required this.createdAt,
    required this.updatedAt,
    required this.uid,
  });

  factory AppUserModel.fromFire(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return AppUserModel(
      id: document.id,
      email: data['email'],
      isCustomer: data['isCustomer'],
      customer: data['customer'] != null
          ? CustomerModel.fromFire(data['customer'])
          : null,
      isFarmer: data['isFarmer'],
      isAdmin: data['isAdmin'],
      isDistributor: data['isDistributor'],
      lastLogin: DateTime.parse(data['lastLogin']),
      createdAt: DateTime.parse(data['createdAt']),
      updatedAt: DateTime.parse(data['updatedAt']),
      uid: data['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'isCustomer': isCustomer,
      'customer': customer?.toJson(),
      'isFarmer': isFarmer,
      'isAdmin': isAdmin,
      'isDistributor': isDistributor,
      'lastLogin': lastLogin.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'uid': uid,
    };
  }
}
