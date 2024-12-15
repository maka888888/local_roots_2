import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/order_model.dart';
import 'package:local_roots_2/providers/customer/orders/orders_stream.dart';
import 'package:local_roots_2/ui/customer/orders/orders_in_selection/farmer_order/tile_farmer.dart';
import 'package:local_roots_2/ui/customer/orders/orders_in_selection/farmer_order/tile_item.dart';

class CustomerOrderInSelection extends ConsumerWidget {
  final String farmerId;
  const CustomerOrderInSelection({super.key, required this.farmerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<OrderModel> orders =
        ref.watch(refCustomerOrdersStreamProvider).valueOrNull ?? [];

    OrderModel? order;

    for (var item in orders) {
      if (item.farmerShort.appUserId == farmerId) {
        order = item;
        break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${AppLocalizations.of(context)!.order} ${order!.orderNumber}'),
      ),
      body: ListView(
        children: [
          CustomerOrderInSelectionTileFarmer(farmer: order.farmerShort),
          const Divider(),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: order.orderItems.length,
            itemBuilder: (context, index) {
              return CustomerOrderInSelectionTileItem(
                  orderItem: order!.orderItems[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 0.5,
              );
            },
          ),
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart_outlined),
        label: Text(
            '${AppLocalizations.of(context)!.toOrder.toUpperCase()} ${order.totalPrice}€'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
