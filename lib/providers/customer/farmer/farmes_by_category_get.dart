import 'package:local_roots_2/models/farmer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'farmer_services.dart';

part 'farmes_by_category_get.g.dart';

@riverpod
class RefCustomerFarmersByCategoryGet
    extends _$RefCustomerFarmersByCategoryGet {
  @override
  FutureOr<List<FarmerModel>> build(String category) async {
    return await ServiceCustomerFarmer().getFarmersByCategory(category);
  }
}
