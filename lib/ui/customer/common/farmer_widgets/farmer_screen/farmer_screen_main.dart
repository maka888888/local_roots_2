import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/customer/farmer/farmer_get.dart';
import 'package:local_roots_2/ui/common/loading_screen/loading_screen_main.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_screen/tab_about/tab_about_main.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_screen/tab_offers/tab_offers_main.dart';

import 'farmer_like_button.dart';

class CustomerFarmer extends ConsumerWidget {
  final String farmerId;
  const CustomerFarmer({super.key, required this.farmerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmer = ref.watch(refCustomerFarmerGetProvider(farmerId));

    return farmer.when(
      data: (data) {
        if (data == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Farmer not found'),
            ),
          );
        } else {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text(data.name),
                actions: [CustomerFarmerLikeButton(farmer: data)],
                bottom: TabBar(
                  tabs: [
                    Tab(text: AppLocalizations.of(context)!.offers),
                    Tab(text: AppLocalizations.of(context)!.about),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  CustomerFarmerTabOffers(farmerId: farmerId),
                  CustomerFarmerTabAbout(farmer: data),
                ],
              ),
            ),
          );
        }
      },
      loading: () => const LoadingScreenMain(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
