import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/sales_location_model.dart';

class ServicesFarmerSalesLocation {
  CollectionReference fireSalesLocations =
      FirebaseFirestore.instance.collection('sales_locations');

  Future<void> createSalesLocation(SalesLocationModel salesLocation) async {
    await fireSalesLocations.add(salesLocation.toJson());
  }

  Stream<List<SalesLocationModel>> streamSalesLocations(String farmerId) {
    return fireSalesLocations
        .where('farmerAppUserId', isEqualTo: farmerId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => SalesLocationModel.fromFire(doc))
            .toList());
  }

  Future<void> updateSalesLocation(SalesLocationModel salesLocation) async {
    await fireSalesLocations.doc(salesLocation.id).update(
          salesLocation.toJson(),
        );
  }

  Stream<SalesLocationModel?> streamSalesLocation(String salesLocationId) {
    return fireSalesLocations.doc(salesLocationId).snapshots().map((doc) {
      if (doc.exists) {
        return SalesLocationModel.fromFire(doc);
      } else {
        return null;
      }
    });
  }
}
