import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'offer_services.dart';

part 'offers_stream.g.dart';

@riverpod
class RefFarmerOffersStream extends _$RefFarmerOffersStream {
  @override
  Stream<List<OfferModel>> build() {
    final AppUserModel appUser = ref.read(refAppUserProvider).value!;

    return ServicesFarmerOffer().streamOffers(appUser.farmer!.appUserId);
  }
}
