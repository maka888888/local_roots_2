import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/providers/customer/view_offer/view_offer_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_offer_post.g.dart';

@riverpod
class RefCustomerOfferViewPost extends _$RefCustomerOfferViewPost {
  @override
  FutureOr<void> build(String offerId) async {
    final appUserModel = ref.watch(refAppUserProvider).valueOrNull;

    if (appUserModel == null) {
      return ServicesCustomerOfferView().addOfferView(offerId, null);
    } else {
      return ServicesCustomerOfferView()
          .addOfferView(offerId, appUserModel.uid);
    }
  }
}
