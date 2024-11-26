import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/view_farmer_model.dart';

class ServicesFarmerView {
  CollectionReference fireFarmerViews =
      FirebaseFirestore.instance.collection('farmer_views');

  Future<List<ViewFarmerModel>> getFarmerViews(String farmerAppUserId) async {
    List<ViewFarmerModel> farmerViews = [];

    QuerySnapshot querySnapshot = await fireFarmerViews
        .where('farmerId', isEqualTo: farmerAppUserId)
        .get();

    for (var element in querySnapshot.docs) {
      farmerViews.add(
        ViewFarmerModel.fromFire(element),
      );
    }
    return farmerViews;
  }
}
