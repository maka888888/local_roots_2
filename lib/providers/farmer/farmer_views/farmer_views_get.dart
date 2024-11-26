import 'package:local_roots_2/models/view_farmer_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'farmer_views_services.dart';

part 'farmer_views_get.g.dart';

@riverpod
class RefFarmerViewsGet extends _$RefFarmerViewsGet {
  @override
  FutureOr<List<ViewFarmerModel>> build() async {
    final appUser = ref.read(refAppUserProvider).value!;

    String farmerAppUserId = appUser.farmer!.appUserId;

    return ServicesFarmerView().getFarmerViews(farmerAppUserId);
  }
}
