import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/order_model.dart';
import 'package:local_roots_2/providers/customer/orders/orders_stream.dart';

import '../../common/orders_widgets/order_in_selection_card/order_in_selection_card_main.dart';

class CustomerOrdersInSelection extends ConsumerWidget {
  const CustomerOrdersInSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<OrderModel> orders =
        ref.watch(refCustomerOrdersStreamProvider).valueOrNull ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.notSubmittedOrders),
      ),
      body: ListView.separated(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomerOrderInSelectionCard(order: orders[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
