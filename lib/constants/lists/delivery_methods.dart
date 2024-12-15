import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/delivery_method_model.dart';

List<DeliveryMethodModel> generateDeliveryMethods(BuildContext context) {
  List<DeliveryMethodModel> deliveryMethodsList = [];

  deliveryMethodsList.add(
    DeliveryMethodModel(
      id: 'pick_up_at_delivery_location',
      nameTranslated: AppLocalizations.of(context)!.pickUpAtDeliveryLocation,
    ),
  );

  deliveryMethodsList.add(
    DeliveryMethodModel(
      id: 'pick_up_at_farmers_location',
      nameTranslated: AppLocalizations.of(context)!.pickUpAtFarmersLocation,
    ),
  );

  deliveryMethodsList.add(
    DeliveryMethodModel(
      id: 'delivery_to_customer_home',
      nameTranslated: AppLocalizations.of(context)!.deliveryToCustomerHome,
    ),
  );

  return deliveryMethodsList;
}
