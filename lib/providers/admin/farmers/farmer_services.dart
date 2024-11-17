import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:local_roots_2/models/app_user_model.dart';

import '../app_users/app_users_services.dart';
import '../offers/offer_services.dart';

class ServicesAdminFarmer {
  // CollectionReference fireFarmers =
  //     FirebaseFirestore.instance.collection('farmers');

  Future changeFarmerStatus(AppUserModel appUser, bool status) async {
    appUser.farmer!.isApproved = status;
    await ServiceAdminAppUser().updateAppUser(appUser);

    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final WriteBatch batch = firestore.batch();

      QuerySnapshot farmersOffers = await ServicesAdminOffer()
          .getFarmersOffers(appUser.farmer!.appUserId);

      for (QueryDocumentSnapshot offerDoc in farmersOffers.docs) {
        batch.update(offerDoc.reference, {'farmerShort.isApproved': status});
      }

      await batch.commit();
    } catch (e) {
      debugPrint('Error updating farmers offers: $e');
    }
  }
}
