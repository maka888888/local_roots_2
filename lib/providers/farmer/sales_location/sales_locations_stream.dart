import 'package:local_roots_2/models/sales_location_model.dart';
import 'package:local_roots_2/providers/farmer/sales_location/sales_location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/app_user_model.dart';
import '../../common/app_user/app_user.dart';

part 'sales_locations_stream.g.dart';

@riverpod
class RefFarmerSalesLocationsStream extends _$RefFarmerSalesLocationsStream {
  @override
  Stream<List<SalesLocationModel>> build() {
    final AppUserModel appUser = ref.read(refAppUserProvider).value!;
    return ServicesFarmerSalesLocation().streamSalesLocations(
      appUser.farmer!.appUserId,
    );
  }
}
