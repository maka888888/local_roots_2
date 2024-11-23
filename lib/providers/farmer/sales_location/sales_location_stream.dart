import 'package:local_roots_2/providers/farmer/sales_location/sales_location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/sales_location_model.dart';

part 'sales_location_stream.g.dart';

@riverpod
class RefFarmerSalesLocationStream extends _$RefFarmerSalesLocationStream {
  @override
  Stream<SalesLocationModel?> build(String locationId) {
    return ServicesFarmerSalesLocation().streamSalesLocation(locationId);
  }
}
