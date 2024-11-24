import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/farmer_like_model.dart';
import 'package:local_roots_2/models/farmer_short_model.dart';

class ServiceCustomerFarmerLikes {
  CollectionReference fireFarmerLikes =
      FirebaseFirestore.instance.collection('farmer_likes');

  Future<void> setLike(FarmerShortModel farmerShort, String customerId) async {
    FarmerLikeModel farmerLike = FarmerLikeModel(
      id: '',
      farmerShort: farmerShort,
      customerId: customerId,
      createdAt: DateTime.now(),
    );

    await fireFarmerLikes.add(farmerLike.toJson());
  }

  Future<void> removeLike(String farmerId, String customerId) async {
    QuerySnapshot docs = await fireFarmerLikes
        .where('farmerShort.appUserId', isEqualTo: farmerId)
        .where('customerId', isEqualTo: customerId)
        .get();
    if (docs.docs.isNotEmpty) {
      await fireFarmerLikes.doc(docs.docs.first.id).delete();
    }
  }

  Stream<List<FarmerLikeModel>> streamLikes(String customerId) {
    return fireFarmerLikes
        .where('customerId', isEqualTo: customerId)
        .snapshots()
        .map((event) {
      return event.docs.map((e) {
        return FarmerLikeModel.fromFire(e);
      }).toList();
    });
  }
}
