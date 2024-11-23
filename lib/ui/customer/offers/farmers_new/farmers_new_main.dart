import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/customer/farmer/farmer_new_stream.dart';

import '../../common/farmer_widgets/farmer_card_tall/farmer_card_tall_main.dart';

class CustomerOffersFarmersNew extends ConsumerWidget {
  const CustomerOffersFarmersNew({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmers = ref.watch(refCustomerFarmersNewStreamProvider);

    return farmers.when(
      data: (data) {
        return SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomerFarmerCardTall(farmer: data[index]);
            },
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
