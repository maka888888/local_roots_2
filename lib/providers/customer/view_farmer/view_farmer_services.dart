import 'package:cloud_firestore/cloud_firestore.dart';

class ServicesCustomerFarmerView {
  CollectionReference fireFarmerViews =
      FirebaseFirestore.instance.collection('farmer_views');

  Future<void> addFarmerView(
      String farmerAppUserId, String? customerAppUserId) async {
    await fireFarmerViews.add({
      'farmerId': farmerAppUserId,
      'customerId': customerAppUserId,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }
}
