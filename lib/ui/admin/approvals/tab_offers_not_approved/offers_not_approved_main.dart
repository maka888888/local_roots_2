import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/admin/offers/offers_not_approved_stream.dart';

import '../../common/offer_widgets/offer_card_long/offer_card_long.dart';

class AdminApprovalsTabOffers extends ConsumerWidget {
  const AdminApprovalsTabOffers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offers = ref.watch(refAdminOffersNotApprovedProvider);

    return offers.when(
      data: (offers) {
        return ListView.separated(
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return AdminOfferCardLong(offer: offers[index]);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
