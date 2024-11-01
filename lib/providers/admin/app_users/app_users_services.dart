import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/app_user_model.dart';

class ServiceAdminAppUser {
  CollectionReference fireAppUsers =
      FirebaseFirestore.instance.collection('app_users');

  Stream<List<AppUserModel>> streamAppUsers() {
    return fireAppUsers.snapshots().map((event) {
      return event.docs.map((e) => AppUserModel.fromFire(e)).toList();
    });
  }

  Future<void> updateAppUser(AppUserModel appUser) async {
    appUser.updatedAt = DateTime.now();
    try {
      await fireAppUsers.doc(appUser.id).update(appUser.toJson());
    } on FirebaseException catch (e) {
      debugPrint('Error updating app user:  ${e.message}');
    } catch (e) {
      debugPrint('Error updating app user: $e');
    }
  }
}
