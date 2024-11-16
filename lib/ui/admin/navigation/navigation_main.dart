import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/ui/common/loading_screen/loading_screen_main.dart';
import 'package:local_roots_2/utils/profiles_switch.dart';

import '../../../providers/common/app_user/app_user.dart';
import 'navigation.dart';

class AdminNavigationMain extends ConsumerWidget {
  const AdminNavigationMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(refAppUserProvider);

    return appUser.when(
      data: (appUser) {
        if (appUser == null || !appUser.isAdmin) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ProfileChanger().changeProfileToCustomer(context, ref);
          });
          return const LoadingScreenMain();
        } else {
          return const AdminNavigation();
        }
      },
      loading: () => const LoadingScreenMain(),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
