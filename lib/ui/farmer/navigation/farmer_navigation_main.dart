import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/common/app_user/app_user.dart';
import '../../../utils/profiles_switch.dart';
import '../../common/loading_screen/loading_screen_main.dart';
import '../onboarding/onboarding_main.dart';
import 'farmer_navigation.dart';

class FarmerNavigationMain extends ConsumerWidget {
  const FarmerNavigationMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(refAppUserProvider);

    return appUser.when(
      data: (appUser) {
        if (appUser == null || !appUser.isFarmer) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ProfileChanger().changeProfileToCustomer(context, ref);
          });
          return const LoadingScreenMain();
        } else {
          if (appUser.farmer == null) {
            return const FarmerOnboarding();
          } else {
            return const FarmerNavigationBoarded();
          }
        }
      },
      loading: () => const LoadingScreenMain(),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
