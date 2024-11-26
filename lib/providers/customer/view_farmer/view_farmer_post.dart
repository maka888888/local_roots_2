import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/providers/customer/view_farmer/view_farmer_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_farmer_post.g.dart';

@riverpod
class RefCustomerFarmerViewPost extends _$RefCustomerFarmerViewPost {
  @override
  FutureOr<void> build(String farmerAppUserId) async {
    final appUserModel = ref.watch(refAppUserProvider).valueOrNull;

    if (appUserModel == null) {
      return ServicesCustomerFarmerView().addFarmerView(farmerAppUserId, null);
    } else {
      return ServicesCustomerFarmerView()
          .addFarmerView(farmerAppUserId, appUserModel.uid);
    }
  }
}
