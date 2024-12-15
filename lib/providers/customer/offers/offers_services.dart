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

  Future<List<OfferModel>> searchOffers(
      List<String> categories, String searchText) async {
    List<OfferModel> offers = <OfferModel>[];

    if (categories.isNotEmpty && searchText.isEmpty) {
      await fireOffers
          .where('category', whereIn: categories)
          .where('isActive', isEqualTo: true)
          .where('isApproved', isEqualTo: true)
          .get()
          .then((value) {
        offers = value.docs.map((doc) => OfferModel.fromFire(doc)).toList();
      });
    } else if (categories.isEmpty && searchText.isNotEmpty) {
      print(searchText);
      await fireOffers
          .where('name', isGreaterThanOrEqualTo: searchText)
          .where('name', isLessThanOrEqualTo: searchText + '\uf8ff')
          //.where('isActive', isEqualTo: true)
          //.where('isApproved', isEqualTo: true)
          .get()
          .then((value) {
        print(value.docs);
        offers = value.docs.map((doc) => OfferModel.fromFire(doc)).toList();
      });
    } else if (categories.isNotEmpty && searchText.isNotEmpty) {
      await fireOffers
          .where('name', whereIn: categories)
          .where('name', isGreaterThanOrEqualTo: searchText)
          .where('title', isLessThanOrEqualTo: searchText + '\uf8ff')
          .where('isActive', isEqualTo: true)
          .where('isApproved', isEqualTo: true)
          .get()
          .then((value) {
        offers = value.docs.map((doc) => OfferModel.fromFire(doc)).toList();
      });
    }

    return offers;
  }
}
