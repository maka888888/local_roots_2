import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../ui/customer/navigation/navigation_not_logged.dart';

part 'go_router.g.dart';

@riverpod
class RefGoRouter extends _$RefGoRouter {
  @override
  GoRouter build() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const CustomerNavigationNotLogged();
          },
        ),
      ],
    );
  }
}
