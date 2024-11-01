import 'package:local_roots_2/models/app_user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_users_services.dart';

part 'app_users_stream.g.dart';

@riverpod
class RefAdminAppUsersStream extends _$RefAdminAppUsersStream {
  @override
  Stream<List<AppUserModel>> build() {
    return ServiceAdminAppUser().streamAppUsers();
  }
}
