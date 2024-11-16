import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/farmer/offer/offers_stream.dart';

import '../../common/offer_widgets/offer_card_long/offer_card_long_main.dart';

class FarmerOffers extends ConsumerWidget {
  const FarmerOffers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offers = ref.watch(refFarmerOffersStreamProvider);

    return offers.when(
      data: (offers) {
        if (offers.isEmpty) {
          return Center(
            child: Text(AppLocalizations.of(context)!.noOffersAtMoment),
          );
        } else {
          return ListView.separated(
            itemCount: offers.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return FarmerOfferCardLong(offer: offers[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          );
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
