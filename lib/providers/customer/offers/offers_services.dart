import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/offer_model.dart';

class ServicesCustomerOffer {
  CollectionReference fireOffers =
      FirebaseFirestore.instance.collection('offers');

  Stream<List<OfferModel>> streamFarmersOffers(String appUserId) {
    return fireOffers
        .where('farmerShort.appUserId', isEqualTo: appUserId)
        .where('farmerShort.isActive', isEqualTo: true)
        .where('farmerShort.isApproved', isEqualTo: true)
        .where('isActive', isEqualTo: true)
        .where('isApproved', isEqualTo: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => OfferModel.fromFire(doc)).toList(),
        );
  }

  Future<OfferModel?> getOffer(String offerId) async {
    DocumentSnapshot doc = await fireOffers.doc(offerId).get();
    return OfferModel.fromFire(doc);
  }
}
