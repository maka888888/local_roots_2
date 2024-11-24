import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/farmer_model.dart';

import '../../../models/app_user_model.dart';

class ServiceCustomerFarmer {
  CollectionReference fireAppUsers =
      FirebaseFirestore.instance.collection('app_users');

  Stream<List<FarmerModel>> streamNewFarmers() {
    return fireAppUsers
        .where('isFarmer', isEqualTo: true)
        .where('farmer', isNotEqualTo: null)
        .where('farmer.isApproved', isEqualTo: true)
        .where('farmer.isActive', isEqualTo: true)
        .orderBy('farmer.createdAt', descending: true)
        .limit(20)
        .snapshots()
        .map((event) {
      return event.docs.map(
        (e) {
          AppUserModel appUser = AppUserModel.fromFire(e);
          return appUser.farmer!;
        },
      ).toList();
    });
  }

  Future<FarmerModel?> getFarmer(String farmedId) async {
    QuerySnapshot docs = await fireAppUsers
        .where(
          'farmer.appUserId',
          isEqualTo: farmedId,
        )
        .get();
    if (docs.docs.isNotEmpty) {
      AppUserModel appUser = AppUserModel.fromFire(docs.docs.first);
      return appUser.farmer;
    } else {
      return null;
    }
  }

  Future<List<FarmerModel>> getFarmersByCategory(String category) async {
    QuerySnapshot docs = await fireAppUsers
        .where(
          'farmer.categories',
          arrayContains: category,
        )
        .get();
    return docs.docs.map((e) {
      AppUserModel appUser = AppUserModel.fromFire(e);
      return appUser.farmer!;
    }).toList();
  }
}
