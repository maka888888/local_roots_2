import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/admin/offers/offers_farmers_stream.dart';
import 'package:local_roots_2/ui/admin/common/offer_widgets/offer_card_long/offer_card_long.dart';

class AdminFarmerTabOffers extends ConsumerWidget {
  final FarmerModel farmer;
  const AdminFarmerTabOffers({super.key, required this.farmer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offers =
        ref.watch(refAdminOffersFarmersStreamProvider(farmer.appUserId));

    return offers.when(
      data: (offers) {
        return ListView.builder(
          itemCount: offers.length,
          itemBuilder: (context, index) {
            final offer = offers[index];
            return AdminOfferCardLong(offer: offer);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
