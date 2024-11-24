import 'package:local_roots_2/models/farmer_short_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'farmer_likes_services.dart';

part 'liked_farmers_stream.g.dart';

@riverpod
class RefCustomerLikedFarmersShortStream
    extends _$RefCustomerLikedFarmersShortStream {
  @override
  Stream<List<FarmerShortModel>> build() {
    final customerId = ref.watch(refAppUserProvider).value!.id;

    return ServiceCustomerFarmerLikes().streamLikes(customerId).map((event) {
      return event.map((e) {
        return e.farmerShort;
      }).toList();
    });
  }
}
