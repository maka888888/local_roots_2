import 'package:local_roots_2/providers/common/profile/profile_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/profile_modes.dart';

part 'profile.g.dart';

@Riverpod(keepAlive: true)
class RefProfile extends _$RefProfile {
  @override
  ProfileMode build() {
    return ProfileMode.customer;
  }

  Future<ProfileMode> getProfileMode() async {
    ProfileMode profileMode = await ProfileServices().getProfileMode();
    state = profileMode;
    return profileMode;
  }

  Future saveProfileTo(ProfileMode profileMode) async {
    state = profileMode;
    await ProfileServices().saveProfileTo(profileMode);
  }
}
