import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/offer_model.dart';
import 'offers_services.dart';

part 'offers_farmer_stream.g.dart';

@riverpod
class RefCustomerOffersFarmerStream extends _$RefCustomerOffersFarmerStream {
  @override
  Stream<List<OfferModel>> build(String appUserId) {
    return ServicesCustomerOffer().streamFarmersOffers(appUserId);
  }
}
