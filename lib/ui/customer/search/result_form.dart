import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/ui/common/loading_widget/loading_widget.dart';

import '../../../providers/customer/offers/offers_search_get.dart';
import '../../common/nothing_found_widget/nothing_found_main.dart';
import '../common/offer_widgets/offer_farmer_card_long/offer_farmer_card_long.dart';

class CustomerSearchResult extends ConsumerWidget {
  final List<String> categories;
  final String searchText;
  const CustomerSearchResult(
      {super.key, required this.categories, required this.searchText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offers =
        ref.watch(refCustomerSearchGetProvider(categories, searchText));

    if (categories.isEmpty && searchText.isEmpty) {
      return const SizedBox.shrink();
    } else {
      return offers.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: NothingFoundMainWidgetMain(),
            );
          } else {
            return ListView.separated(
              itemCount: data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomerOfferFarmerCardLong(offer: data[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
          }
        },
        loading: () => const LoadingWidgetMain(),
        error: (error, stackTrace) => Text('Error: $error'),
      );
    }
  }
}
