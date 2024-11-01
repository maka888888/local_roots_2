import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/profile_modes.dart';

class ProfileServices {
  Future<ProfileMode> getProfileMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String profileMode = prefs.getString('profileMode') ?? 'customer';
    switch (profileMode) {
      case 'customer':
        return ProfileMode.customer;
      case 'farmer':
        return ProfileMode.farmer;
      case 'admin':
        return ProfileMode.admin;
      case 'distributor':
        return ProfileMode.distributor;

      default:
        return ProfileMode.customer;
    }
  }

  Future saveProfileTo(ProfileMode profileMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profileMode', profileMode.toString().split('.').last);
  }
}
