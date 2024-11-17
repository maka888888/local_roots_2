import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/offer_model.dart';
import 'offer_services.dart';

part 'offers_farmers_stream.g.dart';

@riverpod
class RefAdminOffersFarmersStream extends _$RefAdminOffersFarmersStream {
  @override
  Stream<List<OfferModel>> build(String appUserId) {
    return ServicesAdminOffer().streamFarmersOffers(appUserId);
  }
}
