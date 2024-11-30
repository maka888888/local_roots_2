import 'package:local_roots_2/models/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../view_offer/view_offer_post.dart';
import 'offers_services.dart';

part 'offer_get.g.dart';

@riverpod
class RefCustomerOfferGet extends _$RefCustomerOfferGet {
  @override
  FutureOr<OfferModel?> build(String offerId) async {
    ref.read(refCustomerOfferViewPostProvider(offerId));
    return ServicesCustomerOffer().getOffer(offerId);
  }
}
