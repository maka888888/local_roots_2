import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/customer/farmer_likes/liked_farmers_stream.dart';

import '../../../../providers/common/app_user/app_user.dart';
import '../../common/farmer_widgets/farmer_card_tall/farmer_short_card_tall_main.dart';

class CustomerOffersFarmersLiked extends ConsumerWidget {
  const CustomerOffersFarmersLiked({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(refAppUserProvider).valueOrNull;

    if (appUser == null) {
      return const SizedBox();
    } else {
      final farmers = ref.watch(refCustomerLikedFarmersShortStreamProvider);

      return farmers.when(
        data: (data) {
          if (data.isEmpty) {
            return const SizedBox();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    AppLocalizations.of(context)!.myFavoriteFarmers,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomerFarmerShortCardTall(
                          farmerShort: data[index]);
                    },
                  ),
                ),
              ],
            );
          }
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
      );
    }
  }
}
