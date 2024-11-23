import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/customer/offers/offers_farmer_stream.dart';

import '../../../offer_widgets/offer_card_long/offer_card_long.dart';

class CustomerFarmerTabOffers extends ConsumerWidget {
  final String farmerId;
  const CustomerFarmerTabOffers({super.key, required this.farmerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offers = ref.watch(refCustomerOffersFarmerStreamProvider(farmerId));

    return offers.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(
            child: Text('No offers found'),
          );
        } else {
          return ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return CustomerOfferCardLong(offer: data[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          );
        }
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
