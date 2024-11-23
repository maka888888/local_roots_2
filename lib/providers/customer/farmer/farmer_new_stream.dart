import 'package:local_roots_2/models/farmer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'farmer_services.dart';

part 'farmer_new_stream.g.dart';

@riverpod
class RefCustomerFarmersNewStream extends _$RefCustomerFarmersNewStream {
  @override
  Stream<List<FarmerModel>> build() {
    return ServiceCustomerFarmer().streamNewFarmers();
  }
}
