import 'package:local_roots_2/models/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'offers_services.dart';

part 'offer_get.g.dart';

@riverpod
class RefCustomerOfferGet extends _$RefCustomerOfferGet {
  @override
  FutureOr<OfferModel?> build(String offerId) async {
    return ServicesCustomerOffer().getOffer(offerId);
  }
}
