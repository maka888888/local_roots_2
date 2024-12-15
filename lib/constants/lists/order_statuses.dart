import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/order_status_model.dart';

List<OrderStatusModel> generateOrderStatusesList(BuildContext context) {
  List<OrderStatusModel> orderStatusesList = [];

  //pick_up_at_delivery_location
  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'pick_up_at_delivery_location',
      index: 1,
      id: 'customer_selecting_items',
      nameTranslated: AppLocalizations.of(context)!.customerSelectingItems,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'pick_up_at_delivery_location',
      index: 2,
      id: 'customer_placed_order',
      nameTranslated: AppLocalizations.of(context)!.customerPlacedOrder,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'pick_up_at_delivery_location',
      index: 3,
      id: 'farmer_accepted_order',
      nameTranslated: AppLocalizations.of(context)!.farmerAcceptedOrder,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'pick_up_at_delivery_location',
      index: 4,
      id: 'farmer_sent_order',
      nameTranslated: AppLocalizations.of(context)!.farmerSentOrder,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'pick_up_at_delivery_location',
      index: 5,
      id: 'customer_order_is_ready_for_pickup',
      nameTranslated:
          AppLocalizations.of(context)!.customersOrderIsReadyForPickup,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'pick_up_at_delivery_location',
      index: 6,
      id: 'customer_picked_up_order',
      nameTranslated: AppLocalizations.of(context)!.customerPickedUpOrder,
    ),
  );

  //delivery_to_customer_home
  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'delivery_to_customer_home',
      index: 1,
      id: 'customer_selecting_items',
      nameTranslated: AppLocalizations.of(context)!.customerSelectingItems,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'delivery_to_customer_home',
      index: 2,
      id: 'customer_placed_order',
      nameTranslated: AppLocalizations.of(context)!.customerPlacedOrder,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'delivery_to_customer_home',
      index: 3,
      id: 'farmer_accepted_order',
      nameTranslated: AppLocalizations.of(context)!.farmerAcceptedOrder,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'delivery_to_customer_home',
      index: 4,
      id: 'farmer_sent_order',
      nameTranslated: AppLocalizations.of(context)!.farmerSentOrder,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'delivery_to_customer_home',
      index: 5,
      id: 'customer_picked_up_order',
      nameTranslated: AppLocalizations.of(context)!.customerPickedUpOrder,
    ),
  );

  //pick_up_at_farmers_location
  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'pick_up_at_farmers_location',
      index: 1,
      id: 'customer_selecting_items',
      nameTranslated: AppLocalizations.of(context)!.customerSelectingItems,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'pick_up_at_farmers_location',
      index: 2,
      id: 'customer_placed_order',
      nameTranslated: AppLocalizations.of(context)!.customerPlacedOrder,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'pick_up_at_farmers_location',
      index: 3,
      id: 'farmer_accepted_order',
      nameTranslated: AppLocalizations.of(context)!.farmerAcceptedOrder,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'pick_up_at_farmers_location',
      index: 4,
      id: 'customer_order_is_ready_for_pickup',
      nameTranslated:
          AppLocalizations.of(context)!.customersOrderIsReadyForPickup,
    ),
  );

  orderStatusesList.add(
    OrderStatusModel(
      deliveryMethod: 'pick_up_at_farmers_location',
      index: 5,
      id: 'customer_picked_up_order',
      nameTranslated: AppLocalizations.of(context)!.customerPickedUpOrder,
    ),
  );

  return orderStatusesList;
}
