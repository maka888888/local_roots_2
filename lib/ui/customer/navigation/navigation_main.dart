import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/common/app_user/app_user.dart';
import '../onboarding/onboarding_main.dart';
import 'navigation_not_logged.dart';

class CustomerNavigationMain extends ConsumerWidget {
  const CustomerNavigationMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(refAppUserProvider).valueOrNull;

    if (appUser == null) {
      return const CustomerNavigationNotLogged();
    } else {
      if (appUser.customer == null) {
        return const CustomerOnboardingMain();
      } else {
        return const CustomerNavigationNotLogged();
      }
    }
  }
}
