import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/order_model.dart';

import '../../../../../providers/customer/orders/orders_stream.dart';
import '../../../orders/orders_in_selection/orders_in_selection_main.dart';

class CustomerOrdersInSelectionIcon extends ConsumerWidget {
  const CustomerOrdersInSelectionIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<OrderModel> orders =
        ref.watch(refCustomerOrdersStreamProvider).valueOrNull ?? [];

    String? badgeContent;
    int? orderCount;
    int? itemCount;

    if (orders.isNotEmpty) {
      orderCount = orders.length;
      itemCount = 0;
      for (var order in orders) {
        itemCount = itemCount! + order.orderItems.length;
      }

      badgeContent = '$itemCount x $orderCount';
    }

    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CustomerOrdersInSelection(),
          ),
        );
      },
      icon: badges.Badge(
          badgeContent: badgeContent == null
              ? null
              : Text(
                  orderCount.toString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: Theme.of(context).colorScheme.primary,
          ),
          child: const Icon(Icons.shopping_cart_outlined)),
    );
  }
}
