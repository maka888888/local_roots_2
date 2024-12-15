import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/order_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_oval_small.dart';

import '../../../orders/orders_in_selection/farmer_order/farmer_order_main.dart';

class CustomerOrderInSelectionCard extends StatelessWidget {
  final OrderModel order;
  const CustomerOrderInSelectionCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PhotoOvalSmall(photoUrl: order.farmerShort.smallPhoto),
      title: Text(order.farmerShort.name),
      subtitle: Text(
          '${order.orderItems.length} ${AppLocalizations.of(context)!.items}'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return CustomerOrderInSelection(
                  farmerId: order.farmerShort.appUserId);
            },
          ),
        );
      },
    );
  }
}
