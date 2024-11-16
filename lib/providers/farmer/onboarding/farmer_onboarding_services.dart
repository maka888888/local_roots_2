import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/farmer_model.dart';

class ServiceFarmerOnboarding {
  CollectionReference fireFarmerOnboarding =
      FirebaseFirestore.instance.collection('farmer');

  Future<void> createFarmer(FarmerModel farmer) async {
    await fireFarmerOnboarding.add(farmer.toJson());
  }
}
