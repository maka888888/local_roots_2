import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/customer/offers/offer_get.dart';
import 'package:local_roots_2/ui/common/error_screen/error_screen.dart';
import 'package:local_roots_2/ui/common/loading_screen/loading_screen_main.dart';

import 'offer_screen_loaded.dart';

class CustomerOffer extends ConsumerWidget {
  final String offerId;
  const CustomerOffer({super.key, required this.offerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offer = ref.watch(refCustomerOfferGetProvider(offerId));

    return offer.when(
      data: (offer) {
        if (offer == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.offer),
            ),
            body: const Center(
              child: Text('Offer not found'),
            ),
          );
        } else {
          return CustomerOfferLoaded(offer: offer);
        }
      },
      loading: () => const LoadingScreenMain(),
      error: (error, stackTrace) =>
          ErrorScreenMain(errorText: error.toString()),
    );
  }
}
