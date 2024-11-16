import 'package:local_roots_2/models/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'offer_services.dart';

part 'offers_stream.g.dart';

@riverpod
class RefFarmerOffersStream extends _$RefFarmerOffersStream {
  @override
  Stream<List<OfferModel>> build() {
    return ServicesFarmerOffer().streamOffers();
  }
}
