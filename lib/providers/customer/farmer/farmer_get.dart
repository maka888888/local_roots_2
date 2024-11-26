import 'package:local_roots_2/models/farmer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../view_farmer/view_farmer_post.dart';
import 'farmer_services.dart';

part 'farmer_get.g.dart';

@riverpod
class RefCustomerFarmerGet extends _$RefCustomerFarmerGet {
  @override
  FutureOr<FarmerModel?> build(String farmerId) {
    ref.read(refCustomerFarmerViewPostProvider(farmerId));
    return ServiceCustomerFarmer().getFarmer(farmerId);
  }
}
