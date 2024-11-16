import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/profile_modes.dart';
import '../providers/common/profile/profile.dart';

class ProfileChanger {
  Future<void> changeProfileToAdmin(BuildContext context, WidgetRef ref) async {
    await ref
        .read(refProfileProvider.notifier)
        .saveProfileTo(ProfileMode.admin)
        .then((value) {
      if (context.mounted) {
        while (context.canPop() == true) {
          context.pop();
        }
        context.pushReplacement('/');
      }
    });
  }

  Future<void> changeProfileToCustomer(
      BuildContext context, WidgetRef ref) async {
    await ref
        .read(refProfileProvider.notifier)
        .saveProfileTo(ProfileMode.customer)
        .then((value) {
      if (context.mounted) {
        while (context.canPop() == true) {
          context.pop();
        }
        context.pushReplacement('/');
      }
    });
  }

  Future<void> changeProfileToFarmer(
      BuildContext context, WidgetRef ref) async {
    await ref
        .read(refProfileProvider.notifier)
        .saveProfileTo(ProfileMode.farmer)
        .then((value) {
      if (context.mounted) {
        while (context.canPop() == true) {
          context.pop();
        }
        context.pushReplacement('/');
      }
    });
  }
}
