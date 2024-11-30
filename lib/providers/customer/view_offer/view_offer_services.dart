import 'package:cloud_firestore/cloud_firestore.dart';

class ServicesCustomerOfferView {
  CollectionReference fireOfferViews =
      FirebaseFirestore.instance.collection('offer_views');

  Future<void> addOfferView(String offerId, String? customerAppUserId) async {
    await fireOfferViews.add({
      'offerId': offerId,
      'customerId': customerAppUserId,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }
}
