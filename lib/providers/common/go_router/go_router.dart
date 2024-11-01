import 'package:go_router/go_router.dart';
import 'package:local_roots_2/constants/profile_modes.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/ui/common/loading_screen/loading_screen_main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../ui/admin/navigation/navigation_main.dart';
import '../../../ui/common/error_screen/error_screen.dart';
import '../../../ui/customer/navigation/navigation_main.dart';
import '../app_user/app_user.dart';
import '../load/load_get.dart';
import '../profile/profile.dart';

part 'go_router.g.dart';

@Riverpod(keepAlive: true)
class RefGoRouter extends _$RefGoRouter {
  @override
  GoRouter build() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const CustomerNavigationMain();
          },
          redirect: (context, state) {
            final loader = ref.watch(refLoadProvider);

            return loader.when(
              data: (data) {
                final profile = ref.watch(refProfileProvider);

                if (profile == ProfileMode.admin) {
                  AppUserModel? appUser = ref.watch(refAppUserProvider).value;

                  if (appUser != null && appUser.isAdmin) {
                    return '/admin';
                  }

                  return null;
                }
                return null;
              },
              error: (err, stack) {
                return '/error';
              },
              loading: () {
                return '/loading';
              },
            );
          },
        ),
        GoRoute(
          path: '/loading',
          builder: (context, state) {
            return const LoadingScreenMain();
          },
        ),
        GoRoute(
          path: '/admin',
          builder: (context, state) {
            return const AdminNavigation();
          },
        ),
        GoRoute(
          path: '/error',
          builder: (context, state) {
            return const ErrorScreenMain();
          },
        ),
      ],
    );
  }
}
