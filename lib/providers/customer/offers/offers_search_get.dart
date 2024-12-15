import 'package:local_roots_2/models/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'offers_services.dart';

part 'offers_search_get.g.dart';

@riverpod
class RefCustomerSearchGet extends _$RefCustomerSearchGet {
  @override
  FutureOr<List<OfferModel>> build(
      List<String> categories, String searchText) async {
    return ServicesCustomerOffer().searchOffers(categories, searchText);
  }
}
