import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/admin/app_users/app_users_stream.dart';
import 'package:local_roots_2/ui/common/loading_widget/loading_widget.dart';

import '../common/app_user_widgets/app_user_tile/app_user_tile.dart';

class AdminUsersMain extends ConsumerWidget {
  const AdminUsersMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUsers = ref.watch(refAdminAppUsersStreamProvider);

    return appUsers.when(
      data: (appUsers) {
        return ListView.separated(
          itemCount: appUsers.length,
          itemBuilder: (context, index) {
            return AdminAppUserTile(appUser: appUsers[index]);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        );
      },
      error: (err, stack) {
        return Text('Error: $err');
      },
      loading: () {
        return const LoadingWidgetMain();
      },
    );
  }
}
