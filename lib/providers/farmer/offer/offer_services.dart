import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/offer_model.dart';

class ServicesFarmerOffer {
  CollectionReference fireOffers =
      FirebaseFirestore.instance.collection('offers');

  Future<void> createOffer(OfferModel offer) async {
    await fireOffers.add(offer.toJson());
  }

  Stream<List<OfferModel>> streamOffers() {
    return fireOffers.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => OfferModel.fromFire(doc)).toList());
  }

  Future<void> updateOffer(OfferModel offer) async {
    await fireOffers.doc(offer.id).update(offer.toJson());
  }
}
