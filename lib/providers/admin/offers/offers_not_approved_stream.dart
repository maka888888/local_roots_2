import 'package:local_roots_2/models/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'offer_services.dart';

part 'offers_not_approved_stream.g.dart';

@riverpod
class RefAdminOffersNotApproved extends _$RefAdminOffersNotApproved {
  @override
  Stream<List<OfferModel>> build() {
    return ServicesAdminOffer().streamNotApprovedOffers();
  }
}
