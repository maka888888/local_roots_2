import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../models/app_user_model.dart';

class ServiceAppUser {
  CollectionReference fireAppUsers =
      FirebaseFirestore.instance.collection('app_users');

  Stream<AppUserModel?> streamAppUser(String uid) {
    return fireAppUsers.where('uid', isEqualTo: uid).snapshots().map((event) {
      if (event.docs.isNotEmpty) {
        return AppUserModel.fromFire(event.docs.first);
      } else {
        return null;
      }
    });
  }

  Future<AppUserModel?> getAppUser(String uid) async {
    AppUserModel? appUser;
    await fireAppUsers.where('uid', isEqualTo: uid).get().then((value) {
      if (value.docs.isNotEmpty) {
        appUser = AppUserModel.fromFire(value.docs.first);
      } else {
        appUser = null;
      }
    });
    return appUser;
  }

  Future<void> createDefaultAppUser(User user) async {
    AppUserModel appUser = AppUserModel(
      id: '',
      email: user.email!,
      isCustomer: true,
      isFarmer: false,
      isAdmin: false,
      isDistributor: false,
      lastLogin: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      uid: user.uid,
    );

    await fireAppUsers.add(appUser.toJson());
  }

  Future<void> createNewAppUser(AppUserModel appUser) async {
    await fireAppUsers.add(appUser.toJson());
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
