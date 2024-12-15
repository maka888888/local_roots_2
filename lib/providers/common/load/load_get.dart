import 'package:local_roots_2/providers/common/auth/auth_stream.dart';
import 'package:local_roots_2/providers/common/locale/locale.dart';
import 'package:local_roots_2/providers/common/profile/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_user/app_user.dart';

part 'load_get.g.dart';

@Riverpod(keepAlive: true)
class RefLoad extends _$RefLoad {
  @override
  Future<void> build() async {
    await ref.read(refLocaleProvider.notifier).getSavedLocale();
    await ref.read(refProfileProvider.notifier).getProfileMode();

    await ref.read(refAuthStreamProvider.future);
    await ref.read(refAppUserProvider.future);
  }
}
